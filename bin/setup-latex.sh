#! /bin/sh
TEMPLATE_BASE=''https://github.com/smkwlab''

# テンプレートリポジトリ
# - リポジトリ名: ${TEMPLATE_BASE}/テンプレート名/
# - テンプレート本体：リポジトリの main ブランチに格納
# - .gitignore に追加する内容を .gitignore-テンプレート名 に記述

# setup スクリプト作成方法
# ln -s setup-latex.sh setup-リポジトリ名.sh

remote=$(basename ${0} | sed -e 's/^setup-//' -e 's/.sh$//')

git remote add ${remote} ${TEMPLATE_BASE}/${remote}-template.git
git fetch ${remote}
git merge --allow-unrelated-histories -m "merge ${remote} template" ${remote}/main

cat .gitignore-${remote} >> .gitignore
rm .gitignore-${remote}
git add .
git commit -m 'update .gitignore'
git push
