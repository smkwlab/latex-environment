#! /bin/sh
git remote add sotsuron https://github.com/smkwlab/sotsuron-template.git
git fetch sotsuron
git merge --allow-unrelated-histories sotsuron/main
cat .gitignore-sotsuron >> .gitignore
rm .gitignore-sotsuron
git commit -m 'sotsuron repository initialized.'
git push
