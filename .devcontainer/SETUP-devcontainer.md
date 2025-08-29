# VSCode + devcontainer 環境の構築

まず `Visual Stdio Code` (VSCode) の環境を構築する。
次に `Docker Desktop` をインストールする。
Docker Desktop は devcontainer のバックエンドとなり、自動的にコンテナを管理する。

## 1. VSCode のインストール

- Windows マシンにインストールする場合は、`Microsoft Store` を使うのがお勧め
    1. Windows 上で `Microsoft Store` を起動
    2. ストアアプリ内の検索窓を使って `vscode` を検索
    3. `Visual Studio Code` が見つかるはずなのでインストール
- mac 上に環境を構築する場合には `vscode install mac`などで検索し、インストール
- LaTeX Workshop 拡張はコンテナ上にインストールするので、PC(mac)へのインストールは不要

## 2. Docker Desktop のインストール

- Windows なら [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/)をインストール
- Mac なら [Docker Desktop for mac](https://docs.docker.com/desktop/install/mac-install/) をインストール
- Linux なら [公式ドキュメント](https://docs.docker.jp/desktop/install/linux-install.html) に従って作業

## 3. VSCode に Dev Containers 拡張機能をインストール

VSCode でdevcontainer機能を使うために、Dev Containers拡張機能をインストールする。

1. VSCode を起動
2. 左のサイドバーにある拡張機能アイコン（四角が4つのアイコン）をクリック
3. 検索窓に `Dev Containers` と入力
4. `Dev Containers` (Microsoft製) を見つけてインストール

**重要**: この拡張機能がないと、devcontainer環境を利用できない。

### 拡張機能インストールの確認方法

1. VSCode の左下にリモート接続アイコン（><）が表示されていることを確認
2. LaTeX文書を開いた際に、VSCodeが「推奨拡張機能をインストールしますか？」と尋ねたら、**必ず「すべてインストール」または「インストール」を選択**
3. **絶対に「今はしない」や「無視」を選択しないこと**

### トラブルシューティング

もし Dev Containers 拡張機能をインストールせずに進めてしまった場合：

1. VSCode を一度閉じる
2. 拡張機能ビューで `Dev Containers` を検索してインストール
3. 再度プロジェクトを開き直す
