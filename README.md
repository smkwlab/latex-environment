# 下川研卒論テンプレート

## 初期設定

下川研では、卒業論文を作成する標準的な環境として、LaTeX と GitHub を利用する。
文章作成に LaTeX、バージョン管理およびバックアップとして GitHub を使う。

LaTeX の環境構築方法として、下川研では Web サービスである Overleaf を推奨している。
別の方法としては、VScode と Docker を利用してローカルで処理できる環境を構築する方法がある。

以下にそれぞれの環境を構築するための手順を記述する。
どちらかの方法で環境を構築すること。

GitHub においては、詳細は後述するが、GitHub の branch の機能を利用する。

- [Overleaf による環境構築](SETUP-Overleaf.md)
- [VScode + Docker による環境構築](SETUP-Docker.md)


# 卒業論文の作成

## Git 上でのブランチ管理について

今後、卒業研究を書き勧める上で、たくさんの版（バージョン）を作っていく。
初版提出締め切り時に提出する版、第2版提出締め切り時に提出する版、その後、提出締切日に提出する版など。

これらの版を Git 上のブランチで管理する。
Git のブランチについての詳細は各自で調べてみること。

最初は、ダウンロードしたテンプレートが commit されていると思われる。
今後は初版の提出に向けて論文を書き進めていくことになる。
したがって、初版向けのブランチを作成する。
このブランチの名前は **1st-draft** とする。

GitHub Desktop のウィンドウの最上部には、３つのボタンが並んでいる。
一番左側がリポジトリの選択。一番右側が中央リポジトリとのやり取りの処理。
そして、真ん中にあるのがブランチ処理。

```
Current Branch
main
```

と描かれたボタンがある。このボタンの一番右端の``▼``を押す。
そこで表示されるメニューの中に ``New Branch`` というボタンがある。
これをクリック。

`Create a Branch` というダイアログが出る。
ここで `Name` に、今回は
**1st-draft** と入力して、``Create Branch`` ボタンを押す。

真中のボタンが

```
Current Branch
1st-draft
```

に変わる。
これで、ワーキングディレクトリが、従来の **main** ブランチから
**1st-draft** ブランチに移動。
**1st-draft** 提出までは、この状態で作業をする。
commitやpush も **1st-draft** ブランチ上で処理する。

さっそく初版に向けて、執筆を開始する。
Overleaf 上で適宜ファイルを編集していく。
まずは冒頭の author, title, date などを変更する。
さらに、論文のアウトラインを記述する。
具体的には、目次案を元に chapter, section, subsection などを記述する。

これら以外の部分については、空白でも良い。
テンプレートがそのまま残っていても構わない。
この状態で「リコンパイル」すると表紙や目次が入った PDF が生成される。

この状態で、Overlef からソースをダウンロードする。
ダウンロードした zip ファイルを展開し、その中身を**ワーキングディレクトリ**に移動する。
この時ワーキングディレクトリは、1st-draft ブランチになっているはずである。
Git に commit し、GitHub に push する。

ここまでできたら smkwlab ML に報告すること。

この後の基本的な流れは、以下のページの手順に沿って進めることになる。

[https://ueqareer.net/793](https://ueqareer.net/793)

### 提出時の手順

1st, 2nd, 3rd,... 提出時には以下のような手順になる。

1. LaTeX で PDF を作り、[一太郎で校正](README-ichitaro.md)する。
2. LaTeX で PDF を作り一旦印刷し、その印刷版を読み直し、推敲する。この間、適宜 commit して履歴を残しておく。
3. 提出しても良い状況になったと思ったら、Overleaf からダウンロードし、GitHub に commit する。
　この時点で、ワーキングディレクトリは、現在書いている版(例えば 1st-draft)のブランチ。
4. 提出版の PDF を印刷して提出場所に提出する。
5. 提出版の PDF を Google Drive にアップロードする
6. GitHub Desktop で ``Branch`` メニュー→``Create Pull Request``
　ブラウザで GitHub.com の Pull Request 作成画面に移る。
7. Pull Request のタイトル（「1st 提出」とか）と、簡単な説明を書いて、``Create pull request``ボタンをクリック
8. 作成した Pull Request に対して、review リクエストを、下川と神屋先生に出す。大学院生あてに出しても良い。
8. GitHub Desktop 上部の真中のボタンの``▼``を押して、``New Branch``
9. 次の版提出用のブランチを作る。
　この際に、 ``Create branch based on...`` では、現在のブランチを選ぶ。main を選んではいけない。
10. そのうちに、review が返ってくる。その review を元に次の版を執筆する。

簡単に書くと、以下のような手順。
・自分が今から書く版用のブランチを作る。
・そのブランチでその版を書き進める
・提出時には main への pull requestを出し、review request を出す。
・提出後すぐに、現在のブランチをベースにして、次の版のブランチを作成する。

擬似的にこの操作を以下のリポジトリで実施してみた。

 https://github.com/smkwlab/toshi-thesis-branch-test

目次案提出までは、main ブランチで作業。
ブランチの分岐の様子は [Web 上で確認](https://github.com/smkwlab/toshi-thesis-branch-test/network)できる。
その後 1st-draft ブランチを作成し、その上で作業。
1st-draft 提出時に pull request を作成し、toshi0806 にreview をリクエスト。
その後 2nd-draft ブランチを作成し、その上で作業。
添削終了後に pull request を main に merge。
2nd-draft 提出時も pull request を作成し、toshi0806 に review をリクエスト。
その後 3rd-draft ブランチで作業中。

質問があれば、遠慮なく smkwlabML ML へ。
きっと、他の人も困っている。
疑問と回答はみんなで共有しよう。
