#! /bin/sh
TEMPLATE_BASE=''https://github.com/smkwlab''

# テンプレートリポジトリ
# - リポジトリ名: ${TEMPLATE_BASE}/テンプレート名/
# - テンプレート本体：リポジトリの main ブランチに格納
# - .gitignore に追加する内容を .gitignore-テンプレート名 に記述

remote=${1:-'sotsuron'}

git remote add template ${TEMPLATE_BASE}/${remote}-template.git
git fetch template
git merge --allow-unrelated-histories -m "merge ${remote} template" template/main

cat .gitignore-${remote} >> .gitignore
rm .gitignore-${remote}
git add .
git commit -m 'update .gitignore'
git push
