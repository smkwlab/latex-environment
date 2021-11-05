# 下川研卒論テンプレート

## 初期設定

下川研では、卒業論文を作成する標準的な環境として、Overleaf と GitHub を利用しています。
また、詳細は後述しますが、GitHub の branch の機能を利用します。
Overleaf の標準の機能では branch の利用がサポートされていませんので、以下のような手順で環境を構築します。

1. Overleaf の初期設定
  1. 卒業論文のテンプレートプロジェクトをダウンロードする
  1. ダウンロードした卒業用テンプレートプロジェクトを Overleaf にインポートする
1. GitHub の初期設定
  1. GitHub 用のリポジトリーテンプレートを、自分の PC にダウンロードする
  1. ダウンロードしたリポジトリーテンプレートを展開し、自分の PC 上で Git リポジトリ化する
  1. 自分の PC 上の Git リポジトリを GitHub に push する
1. GitHub リポジトリに、論文のソースをダウンロード


これらの手順について詳細を説明します。

### Overleaf の初期設定

1. [卒業論文テンプレートプロジェクト](http://www.is.kyusan-u.ac.jp/~toshi/sotsuron/sotsuron.zip) 
(sotsuron.zip) を自分の PC にダウンロードする。フォルダはどこでもよい。このファイルを展開する必要はない。
1. [Overleaf](https://ja.overleaf.com/project) で 「新規プロジェクト」をクリックする
1. 「プロジェクトのアップロード」を選択する
1. 「Select a .zip file」を選択する
1. 最初にダウンロードした sotsuron.zip を選択する
1. 開いたプロジェクトはコンパイルエラーが表示されている。無視して「メニュー」をクリックし「コンパイラ」を「LaTeX」に変更する
1. 「リコンパイル」をクリックすると、「卒業研究概要」 (gaiyou.tex) のプレビューが表示される。これで LaTeX の基本的な設定ができていることが確認できる
1. 左側のファイル一覧から sotsuron.tex を選択し、「リコンパイル」をクリックすると、「卒業論文」のプレビューが表示される。今後、卒業論文を書き進めるにあたっては、この sotsuron.tex を編集していくことになる
1. なお、example.tex は、卒論の例として入れてある。このファイルは消してもよい。ラベルの付け方など、参考になると思うので、一度は内容を確認してほしい。
1. [Overleaf のプロジェクト一覧](https://ja.overleaf.com/project) に戻る
1. おそらく、今作成したプロジェクトは 「#1」 というタイトルになっているので、これを変更する
  1. #1 の左の□をクリックし「さらに」をクリックし「名前の変更」をクリック
  1. 「卒業論文」など、わかりやすい名前を入力し「名前の変更」をクリック
1. 以上で Overleaf の初期設定は終了

上でも書いていますが、
sotsuron.tex が卒論記述用のテンプレート、
gaiyou.ptex が卒業論文概要用のテンプレートです。

sotsuron.tex だけを見て書き始めると苦労すると思います。
example.tex に、仮想的な卒論の本文を少し記述しています。
表の書き方や図の書き方、章や図表への label の付け方、その label の参照の仕方のサンプルとなることを目指しています。
卒論を記述する際に参考にしてください。
ただし、各自の卒論は sotsuron.tex を更新してください。
example.tex を更新してはいけません。

### GitHub の初期設定
1. [GitHubリポジトリテンプレート](http://www.is.kyusan-u.ac.jp/~toshi/sotsuron/git-template.zip) 
(git-template.zip) を自分の PC にダウンロードする。
1. git-template.zip を展開すると sotsuron フォルダが生成される
1. sotsuron フォルダを、適当なフォルダ (「ドキュメント」など）に移動する
  1. この sotsuron フォルダのことを、以下では「**ワーキングディレクトリ**」と呼びます
1. GitHub Desktop を起動する
1. 「File」メニューから「Add local repository...」をクリック
1. 「Choose...」で、先程移動させた sotsuron フォルダを選択する
1. **「create a repository」をクリック**。ここ重要！
1. 「Name」 は sotsuron のままで良い。他も何も変更せず「Create repository」ボタンをクリック
1. 「Publish repository」をクリック
1. 「Name」 を「toshi-sotsuron」のように、**自分の名前が入った名前にする**。ここも重要！
1. 「Organization」に「smkwlab」を選択
1. 「Publish repository」をクリック
1. [GitHub の smkwlab](https://github.com/smkwlab) に、自分の卒論のリポジトリがあるはず
  1. リポジトリ名を間違ったりした場合には下川に連絡する
1. 以上で GitHub の初期設定は終了。この時点では GitHub リポジトリには、卒論のソースは入っていない



### GitHub リポジトリに、論文のソースをダウンロード
1. [Overleaf](https://ja.overleaf.com/project) から、卒論のプロジェクトをクリック
1. 「メニュー」から「ダウンロード」のところの「ソース」をクリック
1. ダウンロード先はどこでも良い
1. ダウンロードした zip ファイルを展開し、先ほど作成した、**ワーキングディレクトリ**に移動させる
1. GitHub Desktop で卒論のリポジトリをみると、sotsuron.tex, gaiyou.tex, latexmkrc の3つが追加されていることがわかる
1. 適当にコミットメッセージを入力して、Commit to master をクリック
1. 「Push origin」をクリックして GitHub に push
1. 以上で、卒業論文を書くための準備が完了


# 卒業論文の作成

目次案を元に chapter, section, subsection などを記述し、論文原稿の初版を作成してください。
Overleaf 上で適宜ファイルを編集して下さい。

目次以外の部分については、空白でも良いですし、テンプレートがそのまま残っていても構いません。
この状態で、Overlef からソースをダウンロードします。
ダウンロードした zip ファイルを展開し、その中身を**ワーキングディレクトリ**に移動し、
Git に commit し、GitHub に push してください。

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

[https://ueqareer.net/793](https://ueqareer.net/793)

### 提出時の手順

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
8. 作成した Pull Request に対して、review リクエストを、下川と神屋先生に出す。大学院生あてに出しても良い。
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
