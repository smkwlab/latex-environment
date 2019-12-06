# 下川研卒論テンプレート

## テンプレート

卒論記述用のテンプレートとして [sotsuron.tex](sotsuron.tex) を用意しています。

テンプレートと言う割には、本文もすこし記述されてしまっています。

適宜本文の部分は削除したり、コメントアウトしたりして使ってください。
ただ、表の書き方や図の書き方、章や図表への label の付け方、その label の参照の仕方のサンプルとなることを目指しています。
卒論の LaTeX ファイルを記述する際に参考にしてください。

# Git への登録について

目次案を元に chapter, section, subsection などを記述し、論文原稿の初版を作成してください。

各自、論文管理用のリポジトリを 
[GitHub の smkwlab アカウントの下に作成](https://github.com/organizations/smkwlab/repositories/new)
してください。
←のリンクをクリックしたら、リポジトリー作成画面に遷移します。
なお、下川研関係者全員が同じ場所にリポジトリを作ります。
**sotsuron** のような所有者がわからない名前は避けてください。 
**toshi-sotsuron** のようにユーザ名を含むリポジトリ名にしてください。

また、リポジトリを作成する際に、`Add .gitgnore:` は　`None` のままで構いません。
代わりに、このリポジトリに置いている [.gitignore](.gitignore) を、
各自のリポジトリにコピーしてください。
なお、このコピーは最初のコミットより先にしてください。

目次以外の部分については、空白でも良いですし、テンプレートがそのまま残っていても構いません。
その状態で、commit と push をしておいてください。

## Git 上でのブランチ管理について

今後、卒業研究を書き勧める上で、たくさんの版（バージョン）を作っていくことになります。
初版提出締め切り時に提出する版、第2版提出締め切り時に提出する版、その後、提出締切日に提出する版などです。

これらの版を Git 上のブランチで管理します。
Git のブランチについての詳細は各自で調べてください。

最初は、目次だけの版が commit されていると思います。
今後は初版の提出に向けて論文を書き進めていくことになるはずです。
したがって、初版向けのブランチを作ります。
このブランチの名前は **1st-draft** としましょう。

GitHub Desktop のウィンドウの最上部には、３つのボタンが並んでいます。
一番左側がリポジトリの選択。一番右側が中央リポジトリとのやり取りの処理。
そして、真ん中にあるのがブランチ処理です。
```
Current Branch
master
```
と描かれたボタンがあると思います。このボタンの一番右端の``▼``を押してください。
そこで表示されるメニューの中に ``New Branch`` というボタンがあります。
これをクリックしてください。

`Create a Branch` というダイアログが出るはずです。
ここで `Name` に、今回は
**1st-draft** と入力して、``Create Branch`` ボタンを押してください。

真中のボタンが
```
Current Branch
1st-draft
```
に変わったはずです。
ブランチに関する詳細は、ネット上の情報を探してみてください。
これで、ワーキングディレクトリが、従来の **master** ブランチから
**1st-draft** ブランチに移動しました。
**1st-draft** 提出までは、この状態で作業をしてください。
commitやpush も **1st-draft** ブランチ上で処理行ってくださ
い。

この後の基本的な流れは、以下のページに有る手順に沿って進めます。

https://ueqareer.net/793

1st, 2nd, 3rd,... 提出時には以下のような手順になります。

1. LaTeX で PDF を作り、[一太郎で校正](README-ichitaro.md)する。
2. LaTeX で PDF を作り一旦印刷し、その印刷版を読み直し、推敲する。この間、適宜 commit して履歴を残しておく。
3. 提出しても良い状況になったと思ったら commit する。
　この時点で、ワーキングディレクトリは、現在書いている版(例えば 1st-draft)のブランチです。
4. 提出版の PDF を印刷して提出場所に提出する。
5. 提出版の PDF を Google Drive にアップロードする
6. GitHub Desktop で ``Branch`` メニュー→``Create Pull Request``
　ブラウザで GitHub.com の Pull Request 作成画面に移る。
7. Pull Request のタイトル（「1st 提出」とか）と、簡単な説明を書いて、``Create pull request``ボタンをクリック
8. 作成した Pull Request に対して、review リクエストを、下川と神屋先生に出す。侑賢あてに出しても良い。
8. GitHub Desktop 上部の真中のボタンの``▼``を押して、``New Branch``
9. 次の版提出用のブランチを作る。
　この際に、 ``Create branch based on...`` では、現在のブランチを選ぶ。master を選んではいけない。
10. そのうちに、review が返ってくる。返ってきたら、Pull Request を master に merge する。


簡単に書くと、以下のような手順です。
・自分が今から書く版用のブランチを作る。
・そのブランチでその版を書き進める
・提出時には master への pull requestを出し、review request を出す。
・提出後すぐに、現在のブランチをベースにして、次の版のブランチを作成する。

擬似的にこの操作を以下のリポジトリで実施してみました。

 https://github.com/smkwlab/toshi-thesis-branch-test

目次案提出までは、master ブランチで作業しています。
ブランチの分岐の様子は [Web 上で確認](https://github.com/smkwlab/toshi-thesis-branch-test/network)できます。
その後 1st-draft ブランチを作成し、その上で作業。
1st-draft 提出時に pull request を作成し、toshi0806 にreview をリクエスト。
その後 2nd-draft ブランチを作成し、その上で作業。
添削終了後に pull request を master に merge。
2nd-draft 提出時も pull request を作成し、toshi0806 に review をリクエスト。
その後 3rd-draft ブランチで作業中。
という感じです。
