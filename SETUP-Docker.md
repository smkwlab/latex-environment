# VSCode + Docker を用いたローカルでの LaTeX 処理環境の構築

## VScode の環境設定
1. VScode はインストールしておく。未インストールなマシンの場合は、インストール方法は自力で調査すること。それができないのであれば、ローカルでの LaTeX 環境構築は諦めるべき。
1. VScode に [LaTeX Workshop 拡張](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)をインストールする

## Docker のインストール
1. Windows ならば [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)をインストールする。
  - Mac なら [Docker Desktop for mac](https://docs.docker.com/desktop/install/mac-install/) をインストール
1. `docker pull ghcr.io/being24/latex-docker:latest` を実行し LaTeX 実行用コンテナをダウンロードする
  - Windows ならばコマンドプロンプトあるいは Power Shell 上で実行
  - Mac ならばターミナル上で実行
