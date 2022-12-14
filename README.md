# 下川研 LaTeX テンプレート

下川研では、週間報告書・卒業論文・修士論文などを執筆する環境として LaTeX と GitHub を利用する。
文章作成に LaTeX、バージョン管理およびバックアップとして GitHub を使う。

## LaTeX 環境構築
LaTeX の環境構築方法として、VScode + Dev Container を利用する。

- [VScode + Dev Container 環境構築](SETUP-DevContainer.md)

PC上のディスクの残り容量が少ないときには Web サービスである Overleaf も利用可能である。
しかし、Overleaf を使う場合 GitHub 連携が複雑になるので、この方法は推奨しない。

## リポジトリの作成
週間報告書、卒業論文、修士論文など、文章ごとにリポジトリを作成する。
まずは、[このリポジトリ](https://github.com/smkwlab/latex-environment)の
`Use this template` ボタンを押して 
`Create a new repository` を選択する。
リポジトリを作成する際、`Owner` は `smkwlab` のままにしておくと、
下川を含む研究室のメンバーがアクセスできるので添削作業などがスムーズになる。
他の人に見られては困るような書類の場合は、自分のアカウント下に作成する。
`Repository name` は `shimokawa-wr` や `shimokawa-sotsuron` など、
持ち主と内容が分かるものにする。

このリポジトリをベースに LaTeX 文章を書くことにより、
VScode が Dev Container を利用して自動的に LaTeX 環境を構築してくれる。

## 文章テンプレートの用意

卒業論文や週間報告用のテンプレートファイルを用意する。
クローンしたリポジトリの利用目的に応じて、以下の作業を行う。

### 週間報告用

### 卒業論文用
