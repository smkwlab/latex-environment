# Branch Naming Convention

## 標準的なブランチ命名規則

### 1. 機能開発ブランチ
```
feature/short-description
feature/add-yamllint-config
feature/improve-terminal-fonts
```
- **用途**: 新機能追加、機能改善
- **ライフサイクル**: PR マージ後に自動削除
- **命名**: `feature/` + 簡潔な英語説明

### 2. バグ修正ブランチ  
```
fix/short-description
fix/github-actions-permissions
fix/yaml-validation-errors
```
- **用途**: バグ修正、エラー解決
- **ライフサイクル**: PR マージ後に自動削除
- **命名**: `fix/` + 問題の簡潔な説明

### 3. 自動更新ブランチ
```
update/dependency-name
update/texlive-2025e
update/devcontainer-image
```
- **用途**: 依存関係の自動更新
- **ライフサイクル**: PR マージ後に自動削除
- **命名**: `update/` + 更新対象名

### 4. 緊急修正ブランチ
```
hotfix/critical-issue
hotfix/restore-essential-files
hotfix/security-vulnerability
```
- **用途**: 緊急度の高い修正
- **ライフサイクル**: PR マージ後に即座削除
- **命名**: `hotfix/` + 緊急事項の説明

### 5. 実験・テストブランチ
```
experiment/feature-name
experiment/new-automation
test/workflow-validation
```
- **用途**: 実験的な機能、テスト
- **ライフサイクル**: 7日以内に削除（自動クリーンアップ対象）
- **命名**: `experiment/` または `test/` + 実験内容

### 6. 長期開発ブランチ
```
dev/major-feature
dev/ecosystem-integration
```
- **用途**: 大規模な機能開発（複数PR予定）
- **ライフサイクル**: 完了まで保持
- **命名**: `dev/` + 開発プロジェクト名

## 自動削除の対象

### 即座削除（PR マージ後）
- `feature/*`
- `fix/*`  
- `update/*`
- `hotfix/*`

### 定期削除（7日後）
- `experiment/*`
- `test/*`
- マージ済みの全ブランチ

### 保護対象（削除されない）
- `main`
- `release`
- `dev/*` （長期開発用）

## 使用例

```bash
# 良い例
git checkout -b feature/add-yamllint-config
git checkout -b fix/terminal-font-display  
git checkout -b update/texlive-2025e
git checkout -b hotfix/workflow-failure

# 避けるべき例
git checkout -b update-texlive-2025-20250617-012848  # タイムスタンプ付き
git checkout -b test-branch                          # 不明確
git checkout -b fix                                  # 具体性なし
git checkout -b branch1                             # 意味不明
```

## GitHub Actions での使用

```yaml
# 自動生成ブランチの例
BRANCH_NAME="update/texlive-${VERSION}"        # ✅ 良い
BRANCH_NAME="update-texlive-${VERSION}-${TIMESTAMP}"  # ❌ 避ける
```

この命名規則により:
- 自動クリーンアップが正確に動作
- ブランチの目的が明確
- 重複ブランチの防止
- 保守性の向上