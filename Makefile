#
# for making PDF
#

# Docker ではないローカルの LaTeX 環境を使いたい場合、次の行をコメントアウトする
WITH_DOCKER=yes

ifdef WITH_DOCKER
  DOCKER=docker
  DOCKER_OPT=--rm -v
  DOCKER_IMAGE=ghcr.io/smkwlab/latex-docker
  WORK_DIR=/workspaces/$(basename $(CURDIR))/
  DOCKER_RUN=$(DOCKER) run $(DOCKER_OPT) `pwd`:$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) 
.PHONY: sh
sh:
	$(DOCKER) run -it $(DOCKER_OPT) `pwd`:$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) /bin/bash
else
  WORK_DIR=./
  DOCKER_RUN=
endif
LATEXMK=$(DOCKER_RUN) latexmk
TEXTLINT=$(DOCKER_RUN) textlint

.PHONY: all example clean zip zip-dist zip-clean
.SUFFIXES: .tex .pdf
.tex.pdf:
	$(LATEXMK) $(WORK_DIR)$<

all: sotsuron.pdf gaiyou.pdf

example: example.pdf example-gaiyou.pdf

lint: sotsuron.tex
	$(TEXTLINT) $<

linte: example.tex
	$(TEXTLINT) $<

clean:
	$(LATEXMK) -C
	rm *~


#
# for making template zip files
#
WORK=sotsuron
SCP_PROXY=-J sh.is.kyusan-u.ac.jp.
DISTDIR=www.is.kyusan-u.ac.jp.:public_html/sotsuron/

zip: sotsuron.zip git-template.zip

sotsuron.zip: sotsuron.tex gaiyou.tex example.tex example-gaiyou.tex latexmkrc
	zip $@ $^

git-template.zip: .gitignore README.md README-ichitaro.md SETUP-Docker.md SETUP-Overleaf.md
	mkdir $(WORK)
	cp -p $^ $(WORK)
	zip -r $@ $(WORK)
	rm -r $(WORK)

zip-dist: sotsuron.zip git-template.zip
	scp ${SCP_PROXY} -p $^ $(DISTDIR)

zip-clean:
	rm -f sotsuron.zip git-template.zip
