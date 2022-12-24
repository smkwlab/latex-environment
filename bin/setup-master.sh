#! /bin/sh
git remote add thesis https://github.com/smkwlab/master-template.git
git fetch thesis
git merge --allow-unrelated-histories -m 'merge shuron template' thesis/main
cat .gitignore-master >> .gitignore
rm .gitignore-master
git add .
git commit -m 'update .gitignore'
git push
