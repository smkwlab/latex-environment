#! /bin/sh
git remote add wr https://github.com/smkwlab/wr-template.git
git fetch wr
git merge --allow-unrelated-histories -m 'merge weekly report template' wr/main
cat .gitignore-wr >> .gitignore
rm .gitignore-wr
git add .
git commit -m 'update .gitignore'
git push
