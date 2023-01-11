# 下川研 LaTeX 環境

九州産業大学理工学部情報科学科下川研で文章作成をする際の LaTeX 環境として開発した。
ただし、汎用の LaTeX 環境として利用可能である。
下川研特有の機能は [4. 文章テンプレートの用意](#4-文章テンプレートの用意)以降のみである。
下川研以外で利用する場合には、これ以降を無視するか [4.4 その他](#44-その他) を利用する。

下川研では、週間報告書・卒業論文・修士論文などを執筆する環境として LaTeX と GitHub を利用する。
文章作成に LaTeX、バージョン管理およびバックアップとして GitHub を使う。

## 1. LaTeX 環境構築

LaTeX の環境として、VScode + DevContainer を利用する。
[VScode + DevContainer 環境構築](SETUP-DevContainer.md)の手順に従って環境を構築する。

PC上のディスクの残り容量が少ないときは Web サービスである [Overleaf](https://ja.overleaf.com/) も利用可能である。
しかし、Overleaf を使う場合 GitHub 連携が複雑になるので、この方法は推奨しない。

## 2. リポジトリの作成

週間報告書、卒業論文、修士論文など、文章ごとにリポジトリを作成する。

### 2.1 リモートリポジトリ

以下の手順で GitHub 上にリポジトリを作成する。

1. [このリポジトリ](https://github.com/smkwlab/latex-environment)の
`Use this template` ボタンを押して `Create a new repository` を選択
2. リポジトリを作成する際、原則として`Owner` は `smkwlab` のままにしておく。
こうすると、下川を含む研究室のメンバーがアクセスできるので添削作業などがスムーズになる。
私的なドキュメントなど、他の人に見られては困るような書類の場合は、自分のアカウント下に作成してもよい。
3. `Repository name` は `shimokawa-wr` や `shimokawa-sotsuron` など、
持ち主と内容が分かるものにする。
自分のアカウント下に作成する場合は自由。

### 2.2 ローカルリポジトリ

[リモートリポジトリ](#21-リモートリポジトリ)で作成したリポジトリを、自分の PC にクローンする。

1. `GitHub` 上で `Code` をクリックし　`Open with GitHub Desktop` をクリック

## 3. LaTeXコンテナの準備

VScode の DevContainer 機能を使ってコンテナを用意する

1. [ローカルリポジトリ](#22-ローカルリポジトリ)でクローンしたリポジトリを `VScode` で開く。
   - `GitHub Desktop` で `Open in Visual Studio Code` をクリックするのが簡単。
2. VScode 上に Dev Container に関するダイアログが表示されるので、`Reopen in Container` をクリック
   - 初回は、Dev Container 機能が LaTeX 用コンテナを設定（ダウンロード）するので、少し時間がかかる。

## 4. 文章テンプレートの用意

卒業論文や週間報告用のテンプレートファイルを用意する。
作成したリポジトリの利用目的に応じて、以下の作業を行う。

### 4.1 週間報告

[週間報告テンプレート](https://github.com/smkwlab/wr-template)のインストール

1. `VScode` の `ターミナル` メニューから、`新しいターミナル` をクリック
2. `VScode` 内で LaTeX コンテナ上の shell が起動する
3. `./bin/setup-wr.sh` を実行
4. 20yy-mm-dd.tex を 2023-05-18.tex など日付のファイルにコピーして、週毎に週報を作成

### 4.2 卒業論文

[卒業論文テンプレート](https://github.com/smkwlab/sotsuron-template)のインストール

1. `VScode` の `ターミナル` メニューから、`新しいターミナル` をクリック
2. `VScode` 内で LaTeX コンテナ上の shell が起動する
3. `./bin/setup-sotsuron.sh` を実行
4. example-sotsuron.tex を参考に sotsuron.tex を編集

### 4.3 修士論文

[修士論文テンプレート](https://github.com/smkwlab/master-template)のインストール

1. `VScode` の `ターミナル` メニューから、`新しいターミナル` をクリック
2. `VScode` 内で LaTeX コンテナ上の shell が起動する
3. `./bin/setup-master.sh` を実行
4. thesis.tex を編集

### 4.4 その他

[LaTeXテンプレート](https://github.com/smkwlab/latex-template)のインストール

1. `VScode` の `ターミナル` メニューから、`新しいターミナル` をクリック
2. `VScode` 内で LaTeX コンテナ上の shell が起動する
3. `./bin/setup-lastex.sh` を実行
4. main.tex を編集