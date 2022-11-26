#
# Dev Container 環境外の場合、make pdf
#

# Docker ではないローカルの LaTeX 環境を使いたい場合、次の行をコメントアウトする
WITH_DOCKER=yes

ifdef WITH_DOCKER
  WORK_DIR=/workspaces$(basename $(CURDIR))/
  DOCKER=docker
  DOCKER_OPT=--rm -v `pwd`:$(WORK_DIR) -w $(WORK_DIR) $(DOCKER_IMAGE) 
  DOCKER_IMAGE=ghcr.io/smkwlab/latex-docker
  DOCKER_RUN=$(DOCKER) run $(DOCKER_OPT)
.PHONY: sh
sh:
	$(DOCKER) run -it $(DOCKER_OPT) /bin/bash
else
  DOCKER_RUN=
endif
LATEXMK=$(DOCKER_RUN) latexmk
TEXTLINT=$(DOCKER_RUN) textlint

.PHONY: clean
.SUFFIXES: .tex .pdf .lint

.tex.pdf:
	$(LATEXMK) $(WORK_DIR)$<

.tex.lint:
	$(TEXTLINT) $<

clean:
	$(LATEXMK) -C
