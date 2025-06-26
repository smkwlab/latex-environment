# VSCode + devcontainer LaTeX 環境

LaTeX の環境を、VSCode + devcontainer により構築する。
この環境は、LaTeX に加え、textlint も利用可能である。

本環境が用いるコンテナイメージは [texlive-ja-textlint](https://github.com/smkwlab/texlive-ja-textlint) で構築したものである。

## ⚠️ 重要: 必須拡張機能のインストール

**この環境を使用する前に、VSCode に Dev Containers 拡張機能が必ずインストールされている必要がある。**

この拡張機能がないと、LaTeX環境が正常に動作しない。VSCodeでこのリポジトリを開いた際に表示される拡張機能のインストール推奨ダイアログで、**必ず「インストール」を選択すること。**

## 1. 基礎環境構築

VSCode + devcontainer を利用するために、
まず [VSCode + devcontainer 環境構築](.devcontainer/SETUP-devcontainer.md)の手順に従って基礎となる環境を構築する。

`LaTeX 処理系`は VSCode の devcontainer 機能が自動的にインストールする。

## 2. リポジトリの作成

文章ごとに、本リポジトリを元にリポジトリを作成する。

したがって、文章ごとにコンテナを作成することになる。
ただし、コンテナイメージは build 済みのものを利用することと、
すべての devcontainer で共通のコンテナイメージを使うため、
コンテナ構築時間やディスク容量的な負荷は大きくない。

### 2.1 リモートリポジトリ

以下の手順で GitHub 上にリポジトリを作成する。

1. [このリポジトリ](https://github.com/smkwlab/latex-environment)の
`Use this template` ボタンを押して `Create a new repository` を選択。

### 2.2 ローカルリポジトリ

[リモートリポジトリ](#21-リモートリポジトリ)で作成したリポジトリを、自分の PC にクローンする。

- `GitHub` 上で `Code` をクリックし　`Open with GitHub Desktop` をクリック。
- もちろん、他の方法でクローンしても良い。

## 3. LaTeX環境の構築

VSCode の devcontainer 機能が LaTeX 環境を自動で構築する。

1. [ローカルリポジトリ](#22-ローカルリポジトリ)でクローンしたリポジトリを `VSCode` で開く。
   - `GitHub Desktop` で `Open in Visual Studio Code` をクリックするのが簡単。
2. VSCode 上に devcontainer に関するダイアログが表示されるので、`Reopen in Container` をクリック
   - 初回は、devcontainer 機能が LaTeX 用コンテナを設定（ダウンロード）するので、少し時間がかかる。

## 4. LaTeX ファイルの編集

あとは、適宜 .tex ファイルを作成し編集する。

.texファイルを保存すると、自動で `latexmk` が起動し PDF ファイルを生成する。
この動作が不要な場合には [settings.json](.vscode/settings.json)中の以下の行の `onSave` を `never` などに変更する。

```json
"latex-workshop.latex.autoBuild.run": "onSave",
```

SyncTeX も有効なので、.tex ファイルと PDF ファイルの相互ジャンプも可能。
texファイル上で `Ctrl+Alt+j` (`command+option+j`)を押すと、対応する位置に PDF 表示がジャンプする。
PDF表示上で、`Ctrl`(`command`)を押しながらクリックすると、対応する tex ファイルの行にカーソルがジャンプする。

.texファイル保存時には `textlint` が起動し文章をチェックする。
この結果は `VSCode` の `問題`ウィンドウに表示される。
