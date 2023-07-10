# VSCode + devcontainer 環境の構築

まず `Visual Stdio Code` (VSCode) の環境を構築する。
次に `Windows Subsystem for Linux`(WSL) をインストールする。
WSL は `LaTeX 処理系` 用コンテナを実行するために利用する。
最後に `Docker Desktop` をインストールする。
Docker Desktop は devcontainer のバックエンドとなり、自動的にコンテナを管理する。

## 1. VSCode のインストール

- Windows マシンにインストールする場合は、`Microsoft Store` を使うのがお勧め
    1. Windows 上で `Microsoft Store` を起動
    2. ストアアプリ内の検索窓を使って `vscode` を検索
    3. `Visual Studio Code` が見つかるはずなのでインストール
- mac 上に環境を構築する場合には `vscode install mac`などで検索し、インストール
- LaTeX Workshop 拡張はコンテナ上にインストールするので、PC(mac)へのインストールは不要

## 2. WSL のインストール

Windows 上で利用する場合 WSL が必要である。
mac および Linux 上で利用する場合、
および既に WSL インストール済みならば [3. Docker Desktop のインストール](#3-docker-desktop-のインストール)に進む
  
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
1. WSL のメモリ使用量が気になる場合は、以下の操作でメモリ使用量の上限を 1GB を抑えることができる。
   1. スタートボタンを右クリックし `Windows Powershell(I)`をクリック
   2. 以下の内容をコピーし、PowerShell 上に貼り付けて実行

```powershell
Set-Content -Path $Env:HOMEPATH\.wslconfig -Force -Value @'
[wsl2]
memory=1GB
'@
```

## 3. Docker Desktop のインストール

- Windows なら [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)をインストール
- Mac なら [Docker Desktop for mac](https://docs.docker.com/desktop/install/mac-install/) をインストール
- Linux なら [公式ドキュメント](https://docs.docker.jp/desktop/install/linux-install.html) に従って作業
