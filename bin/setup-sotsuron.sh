#! /bin/sh
git remote add sotsuron git@github.com:smkwlab/sotsuron-template.git
git fetch sotsuron
git merge --allow-unrelated-histories sotsuron/main
git commit -m 'sotsuron repository initialized.'
git push
