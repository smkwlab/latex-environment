# Overleaf を用いた環境の構築

Overleaf の標準の機能では branch の利用がサポートされていないので、以下のような手順で環境を構築する。
この手順の詳細は後ほど説明する。

1. Overleaf の初期設定
   1. 卒業論文のテンプレートプロジェクトをダウンロード
   1. ダウンロードした卒業用テンプレートプロジェクトを Overleaf にインポート
1. GitHub の初期設定
   1. GitHub 用のリポジトリーテンプレートを、自分の PC にダウンロード
   1. ダウンロードしたリポジトリーテンプレートを展開し、自分の PC 上で Git リポジトリ化
   1. 自分の PC 上の Git リポジトリを GitHub に push
1. GitHub リポジトリに、論文のソースをダウンロード

## Overleaf の初期設定

1. [卒業論文テンプレートプロジェクト](https://github.com/smkwlab/sotsuron-template/raw/master/sotsuron.zip) 
(sotsuron.zip) を自分の PC にダウンロードする。フォルダはどこでもよい。このファイルを展開する必要はない。
1. [Overleaf](https://ja.overleaf.com/project) で 「新規プロジェクト」をクリック
1. 「プロジェクトのアップロード」を選択
1. 「Select a .zip file」を選択
1. 1.でダウンロードした sotsuron.zip を選択する
1. 開いたプロジェクトはコンパイルエラーが表示されている。無視して「メニュー」をクリックし「コンパイラ」を「LaTeX」に変更する
1. 「リコンパイル」をクリックすると、「卒業研究概要」 (gaiyou.tex) のプレビューが表示される。これで LaTeX の基本的な設定ができていることが確認できる
1. 左側のファイル一覧から sotsuron.tex を選択し、「リコンパイル」をクリックすると、「卒業論文」のプレビューが表示される。
1. [Overleaf のプロジェクト一覧](https://ja.overleaf.com/project) に戻る
1. おそらく、今作成したプロジェクトは 「#1」 というタイトルになっているので、これを変更
  1. #1 の左の□をクリックし「さらに」をクリックし「名前の変更」をクリック
  1. 「卒業論文」など、わかりやすい名前を入力し「名前の変更」をクリック
1. 以上で Overleaf の初期設定は終了

上でも書いているが、
sotsuron.tex が卒論記述用のテンプレート、
gaiyou.ptex が卒業論文概要記述用のテンプレート。

sotsuron.tex だけを見て書き始めると苦労すると思われる。
example.tex に、仮想的な卒論の本文を少し記述している。
表の書き方や図の書き方、章や図表への label の付け方、その label の参照の仕方など、
卒論を記述する際に参考にしてほしい。
ただし、各自の卒論は sotsuron.tex を更新すること。
example.tex を更新してはいけない。

## GitHub の初期設定
1. [GitHubリポジトリテンプレート](https://github.com/smkwlab/sotsuron-template/raw/master/git-template.zip) 
(git-template.zip) を自分の PC にダウンロードする。
1. git-template.zip を展開すると sotsuron フォルダが生成される
1. sotsuron フォルダを、適当なフォルダ (「ドキュメント」など）に移動する
  1. この sotsuron フォルダのことを、以下では「**ワーキングディレクトリ**」と呼ぶ
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


## GitHub リポジトリに、論文のソースをダウンロード
1. [Overleaf](https://ja.overleaf.com/project) から、卒論のプロジェクトをクリック
1. 「メニュー」から「ダウンロード」のところの「ソース」をクリック
1. ダウンロード先はどこでも良い
1. ダウンロードした zip ファイルを展開し、先ほど作成した、**ワーキングディレクトリ**に移動させる
1. GitHub Desktop で卒論のリポジトリをみると、sotsuron.tex, gaiyou.tex, latexmkrc の3つが追加されていることがわかる
1. 適当にコミットメッセージを入力して、Commit to main をクリック
1. 「Push origin」をクリックして GitHub に push
1. 以上で、卒業論文を書くための準備が完了

