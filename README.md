# VSCode + devcontainer LaTeX 環境

LaTeX の環境を、VScode + DevContainer により構築する。
この環境は、LaTeX に加え、textlint も利用可能である。

本環境が用いるコンテナイメージは [latex-image](https://github.com/smkwlab/latex-image) で構築したものである。

## 1. 基礎環境構築

VSCode + DevContainer を利用するために、
まず [VScode + DevContainer 環境構築](SETUP-DevContainer.md)の手順に従って基礎となる環境を構築する。


## 2. リポジトリの作成

文章ごとに、本リポジトリを元にリポジトリを作成する。

したがって、文章ごとにコンテナを作成することになる。
ただし、コンテナイメージは build 済みのものを利用することと、
すべての devcontainer で共通のコンテナイメージを使うため、
コンテナ構築時間やディスク容量的な負荷は大きくはない。

### 2.1 リモートリポジトリ

以下の手順で GitHub 上にリポジトリを作成する。

1. [このリポジトリ](https://github.com/smkwlab/latex-environment)の
`Use this template` ボタンを押して `Create a new repository` を選択

### 2.2 ローカルリポジトリ

[リモートリポジトリ](#21-リモートリポジトリ)で作成したリポジトリを、自分の PC にクローンする。

- `GitHub` 上で `Code` をクリックし　`Open with GitHub Desktop` をクリック
- もちろん、他の方法でクローンしても良い

## 3. LaTeX環境の構築

VScode の DevContainer 機能が LaTeX 環境を自動で構築する

1. [ローカルリポジトリ](#22-ローカルリポジトリ)でクローンしたリポジトリを `VSCode` で開く。
   - `GitHub Desktop` で `Open in Visual Studio Code` をクリックするのが簡単。
2. VScode 上に Dev Container に関するダイアログが表示されるので、`Reopen in Container` をクリック
   - 初回は、Dev Container 機能が LaTeX 用コンテナを設定（ダウンロード）するので、少し時間がかかる。

## 4. LaTeX ファイルの編集

あとは、適宜 .tex ファイルを作成する。
`VSCode` の `LaTeX Workshop`がインストール済みなので、
これを活用し編集作業を進める。
