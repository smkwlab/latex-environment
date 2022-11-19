# VSCode + Docker を用いたローカルでの LaTeX 処理環境の構築

## VScode の環境設定
1. VScode はインストールしておく。未インストールなマシンの場合は、インストール方法は自力で調査すること。それができないのであれば、ローカルでの LaTeX 環境構築は諦めるべき。
1. VScode に [LaTeX Workshop 拡張](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)をインストールする

## Docker のインストール
1. Windows ならば [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)をインストールする。
   - Mac なら [Docker Desktop for mac](https://docs.docker.com/desktop/install/mac-install/) をインストール
2. `docker pull ghcr.io/being24/latex-docker:latest` を実行し LaTeX 実行用コンテナをダウンロードする
    - Windows ならばコマンドプロンプトあるいは Power Shell 上で実行
    - Mac ならばターミナル上で実行

## 論文執筆用リポジトリの作成

1. GitHub 上でテンプレートをコピー
   - [このリポジトリ](https://github.com/smkwlab/sotsuron-template) の `Use this template` ボタンをクリックし、`Create a new repository` をクリック
   - 次の画面で `Owner` が `smkwlab` になっていることを確認し、`Repository name` には、`shimokawa-sotsuron` のように、誰の卒論のリポジトリか分かりやすい名前をつける
   - その下は `private` のままで良い。世間に公開する必要はない
   - `Create repository from template` をクリックしリポジトリを作成
1. 自分の PC にリポジトリをクローン
   - 上で作成した自分のリポジトリの `Code` をクリックし、`Open with GitHub Desktop` をクリックし、自分の PC にクローンする
1. 以上で、卒業論文を書くための準備が完了

リポジトリ内の sotsuron.tex が卒論記述用のテンプレート、 gaiyou.ptex が卒業論文概要記述用のテンプレート。

sotsuron.tex だけを見て書き始めると苦労すると思われる。 example.tex に、仮想的な卒論の本文を少し記述している。 表の書き方や図の書き方、章や図表への label の付け方、その label の参照の仕方など、 卒論を記述する際に参考にしてほしい。 ただし、各自の卒論は sotsuron.tex を更新すること。 example.tex を更新してはいけない。

