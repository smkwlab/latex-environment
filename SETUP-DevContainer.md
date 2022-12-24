# VSCode + DevContainer を用いた LaTeX 処理環境の構築

まず `Visual Stdio Code` (VScode) の環境を構築する。
次に　`Windows Subsystem for Linux`(WSL) をインストールする。
WSL は `LaTeX 処理系` 用コンテナを実行するために利用する。
最後に `Docker Desktop` をインストールする。
Docker Desktop は Dev Container のバックエンドとなり、自動的にコンテナを管理する。
`LaTeX 処理系`は VScode の DevContainer 機能が自動的にインストールする。

## 1. VScode のインストール

- 近年の貸与 PC では標準でインストール済
- 貸与PC以外の Windows マシンにインストールする場合は、`Microsoft Store` を使うのがお勧め
    1. Windows 上で `Microsoft Store` を起動
    2. ストアアプリ内の検索窓を使って `vscode` を検索
    3. `Visual Studio Code` が見つかるはずなのでインストール
- Mac 上に環境を構築する場合には `vscode install mac`などで検索し、インストール
- LaTeX Workshop 拡張はコンテナ上にインストールするので、PC(Mac)へのインストールは不要

## 2. WSL のインストール

既に WSL インストール済みならば [3. Docker Desktop のインストール](#3-docker-desktop-のインストール)に進む
  
1. スタートメニューボタンを右クリックし `Windows PowerShell (管理者)(A)`をクリック
    - `このアプリがデバイスに変更を加えることを許可しますか?` というダイアログが表示されたら `はい` を選択
1. `wsl --install` を実行
    - `このアプリがデバイスに変更を加えることを許可しますか?` というダイアログが表示されたら `はい` を選択
1. `要求された操作は正常に終了しました。変更を有効にするには、システムを再起動する必要があります。` というメッセージが表示されるので、PC を再起動
1. 再起動後 `Installing, this may take a few minutes...` と表示されるので、しばらく待つ
1. `Enter new UNIX username:` というプロンプトに対しては、`smkwlab.net のアカウント名`を入力
1. `New password:` に対しては、好きなパスワードを入力
   - このパスワードを忘れた場合、リカバリが困難なので注意
1. `Retype new password:` に対しては、6. と同じパスワードを再度入力
1. Ubunt Linux のプロンプトが表示されたら、`exit` を実行して終了して OK

## 3. Docker Desktop のインストール

- Windows なら [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)をインストール
- Mac なら [Docker Desktop for mac](https://docs.docker.com/desktop/install/mac-install/) をインストール
