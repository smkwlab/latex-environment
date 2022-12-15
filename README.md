# 下川研 LaTeX テンプレート

下川研では、週間報告書・卒業論文・修士論文などを執筆する環境として LaTeX と GitHub を利用する。
文章作成に LaTeX、バージョン管理およびバックアップとして GitHub を使う。

## 1. LaTeX 環境構築

LaTeX の環境構築方法として、VScode + DevContainer を利用する。

[VScode + DevContainer 環境構築](SETUP-DevContainer.md)の手順に従って環境を構築する。

PC上のディスクの残り容量が少ないときには Web サービスである [Overleaf](https://ja.overleaf.com/) も利用可能である。
しかし、Overleaf を使う場合 GitHub 連携が複雑になるので、この方法は推奨しない。

## 2. リポジトリの作成

週間報告書、卒業論文、修士論文など、文章ごとにリポジトリを作成する。

### 2.1 リモートリポジトリ

以下の手順で GitHub 上にリポジトリを作成する。

1. [このリポジトリ](https://github.com/smkwlab/latex-environment)の
`Use this template` ボタンを押して `Create a new repository` を選択
2. リポジトリを作成する際、`Owner` は `smkwlab` のままにしておくと、
下川を含む研究室のメンバーがアクセスできるので添削作業などがスムーズになる。
他の人に見られては困るような書類の場合は、自分のアカウント下に作成する。
3. `Repository name` は `shimokawa-wr` や `shimokawa-sotsuron` など、
持ち主と内容が分かるものにする。

### 2.2 ローカルリポジトリ

[リモートリポジトリ](#2.1-リモートリポジトリ)で作成したリポジトリを、自分の PC にクローンする。

1. `GitHub` 上で `Code` をクリックし　`Open with GitHub Desktop` をクリック

## 3. LaTeXコンテナの準備

VScode の DevContainer 機能を使ってコンテナを用意する

1. [ローカルリポジトリ](#2.2-ローカルリポジトリ)でクローンしたリポジトリを `VScode` で開く。

   - `GitHub Desktop` で `Open in Visual Studio Code` をクリックするのが簡単。
2. VScode 上に Dev Container に関するダイアログが表示されるので、`Reopen in Container` をクリック
   - 初回は、Dev Container 機能が LaTeX 用コンテナを設定（ダウンロード）するので、少し時間がかかる。
3. `LaTeX Workshop 拡張をインストールしたほうが良い` 的なダイアログが表示される。
これは、コンテナ上の VScode に拡張をインストールしますか？という確認。
問題ないので `Install` (あるいは`インストール`) をクリック。

## 4. 文章テンプレートの用意

卒業論文や週間報告用のテンプレートファイルを用意する。
作成したリポジトリの利用目的に応じて、以下の作業を行う。

### 4.1 週間報告用

### 4.2 卒業論文用

1. `VScode` の `ターミナル` メニューから、`新しいターミナル` をクリック
2. `VScode` 内で LaTeX コンテナ上の shell が起動する
3. `./bin/setup-sotsuron.sh` を実行
