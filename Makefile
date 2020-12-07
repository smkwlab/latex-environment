WORK=sotsuron
DISTDIR=www.is.kyusan-u.ac.jp.:public_html/sotsuron/

all: sotsuron.zip git-template.zip

sotsuron.zip: sotsuron.tex gaiyou.tex example.tex latexmkrc
	zip $@ $^

git-template.zip: .gitignore README.md README-ichitaro.md pdf2txt.sh
	mkdir $(WORK)
	cp -p $^ $(WORK)
	zip -r $@ $(WORK)
	rm -r $(WORK)

dist: sotsuron.zip git-template.zip
	scp -p $^ $(DISTDIR)

clean:
	rm -f sotsuron.zip git-template.zip
