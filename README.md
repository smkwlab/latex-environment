# 下川研 LaTeX テンプレート

下川研では、週間報告書・卒業論文・修士論文などを執筆する環境として LaTeX と GitHub を利用する。
文章作成に LaTeX、バージョン管理およびバックアップとして GitHub を使う。

## LaTeX 環境構築
LaTeX の環境構築方法として、VScode + Dev Container を利用する。

- [VScode + Dev Container 環境構築](SETUP-DevContainer.md)

PC上のディスクの残り容量が少ないときには Web サービスである Overleaf も利用可能である。
しかし、Overleaf を使う場合 GitHub 連携が複雑になるので、この方法は推奨しない。

## リポジトリのクローン
週間報告書、卒業論文、修士論文など、文章ごとにリポジトリを作成する。
まずは、このリポジトリを自分の PC にクローンする。
クローンする際に、PC上のリポジトリ名を、`latex-environment` のままではなく、`weekly-report` や `sotsuron` など、内容に応じたものを指定すること。

このリポジトリをベースに LaTeX 文章を書くことにより、VScode が Dev Container を利用して自動的に LaTeX 環境を構築してくれる。

## 文章テンプレートの用意

卒業論文や週間報告用のテンプレートファイルを用意する。
クローンしたリポジトリの利用目的に応じて、以下の作業を行う。

### 週間報告用

### 卒業論文用
