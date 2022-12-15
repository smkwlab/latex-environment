#! /bin/sh
git remote add sotsuron https://github.com/smkwlab/sotsuron-template.git
git fetch sotsuron
git merge --allow-unrelated-histories -m 'merge sotsuron template' sotsuron/main
cat .gitignore-sotsuron >> .gitignore
rm .gitignore-sotsuron
git add .
git commit -m 'update .gitignore'
git push
