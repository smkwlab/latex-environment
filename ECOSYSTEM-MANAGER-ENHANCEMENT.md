# ecosystem-manager.sh Enhancement: Issue Tracking Integration

## 概要
ecosystem-manager.shにGitHub Issue情報の表示機能を追加し、エコシステム全体の課題管理状況を一元的に把握できるように拡張しました。

## 実装された機能

### 1. Issue情報の表示
```bash
Repository                     Branch          Changes    Last Commit          Issues
----------                     ------          -------    -----------          ------
latex-environment             main            clean      a1b2c3d 2 hours ago   3 open (1 bug, 2 features)
sotsuron-template             main            clean      d4e5f6g 1 day ago     5 open (3 bugs, 1 feature) 🚨
texlive-ja-textlint          main            clean      h7i8j9k 1 week ago    0 open
```

### 2. 緊急Issue検出
```bash
./ecosystem-manager.sh status --urgent-issues
🚨 Repositories with Urgent Issues

sotsuron-template             main            clean      d4e5f6g 1 day ago     5 open (3 bugs, 1 feature) 🚨
```

### 3. Issue分類とビジュアル表示
- **分類表示**: バグとフィーチャーリクエストを自動分類
- **緊急度表示**: 🚨マークで緊急Issueを強調
- **カラーコーディング**: 緊急Issueを赤色で表示

## 技術実装

### 新規追加関数

#### `get_issue_status(repo)`
GitHub CLIを使用してIssue情報を取得
```bash
# 出力形式: "total|bugs|enhancements|urgent"
# 例: "5|2|2|1" (合計5件、バグ2件、機能要求2件、緊急1件)
```

#### `format_issue_info(issue_data)`
Issue情報を人間が読みやすい形式に整形
```bash
# 入力: "5|2|2|1"
# 出力: "5 open (2 bugs, 2 features) 🚨"
```

### 拡張されたオプション

#### `--urgent-issues`
緊急度の高いIssueがあるリポジトリのみを表示
- ラベル検出: `critical`, `urgent`, `high`
- 自動フィルタリング機能
- 緊急事態の早期発見に最適

### ラベル分類ロジック

#### バグ関連
- `bug`, `error`, `critical`, `regression`
- 大文字小文字を区別しない正規表現マッチング

#### 機能要求関連
- `enhancement`, `feature`, `improvement`, `request`

#### 緊急度関連
- `critical`, `urgent`, `high`

## 使用例

### 基本的な使用
```bash
# 全リポジトリの状況確認（Issue情報付き）
./ecosystem-manager.sh status

# 特定リポジトリのみ
./ecosystem-manager.sh status --repo latex-environment

# 詳細表示
./ecosystem-manager.sh status --verbose
```

### 緊急事態対応
```bash
# 緊急Issueの確認
./ecosystem-manager.sh status --urgent-issues

# 緊急Issue詳細確認
./ecosystem-manager.sh status --urgent-issues --verbose
```

## エラーハンドリング

### GitHub CLI未インストール時
- 自動的にフォールバック
- Issue列は "0 open" と表示
- エラーメッセージは非表示

### API制限・認証エラー時
- 安全な処理で続行
- Issue情報のみスキップ
- 他の機能には影響なし

### ネットワークエラー時
- タイムアウト設定により適切に処理
- レスポンス性を維持

## パフォーマンス考慮

### APIコール最適化
- 必要な情報のみ取得
- JSON処理の効率化
- jqによる高速フィルタリング

### 非同期処理準備
- 将来的な並列処理に対応可能な設計
- レスポンス時間の改善余地

## セキュリティ

### 安全なAPI使用
- GitHub CLI認証メカニズムを活用
- トークン情報の適切な処理
- プライベートリポジトリへの配慮

### 入力検証
- JSON レスポンス検証
- 不正なラベル名に対する保護
- SQLインジェクション等の脆弱性なし

## 今後の拡張予定

### Phase 2: PR情報統合
- PR数と状態の表示
- レビュー待ち状態の検出
- マージ可能性の表示

### Phase 3: 高度なフィルタリング
- `--with-issues`: Issue存在リポジトリのみ
- `--bugs`: バグIssueがあるリポジトリのみ
- `--needs-review`: レビュー要求状態の検出

### Phase 4: 統合ダッシュボード
- `issue-summary`: エコシステム全体のIssue概要
- `activity-summary`: PR・Issue・コミット活動統合
- 統計情報とトレンド分析

## 互換性

### 後方互換性
- 既存のオプションは全て維持
- 新しい列の追加のみ
- スクリプトAPIは変更なし

### 依存関係
- **必須**: `jq` (JSON処理)
- **推奨**: `gh` CLI (GitHub操作)
- **任意**: カラー表示対応ターミナル

## メンテナンス

### 定期的な確認項目
- GitHub API仕様変更への対応
- ラベル命名規則の更新
- パフォーマンス最適化

### カスタマイズ可能項目
- ラベル分類ルールの調整
- 緊急度判定基準の変更
- 表示形式のカスタマイズ

## 利用者への影響

### 開発者
- エコシステム全体の課題状況を一目で把握
- 緊急事態の早期発見
- 効率的な作業優先度付け

### プロジェクト管理者
- リソース配分の最適化
- バグ修正vs機能開発のバランス調整
- 学生サポートの改善

### 学生・利用者
- 報告したIssueの状況確認
- システム全体の健全性把握
- サポート状況の透明性向上

この実装により、ecosystem-manager.shは単なるGit管理ツールから**総合的なプロジェクト管理ダッシュボード**へと進化しました。