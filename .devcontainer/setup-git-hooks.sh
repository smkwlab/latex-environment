#!/bin/bash
# Setup git hooks for review workflow repositories
# This script is automatically executed during DevContainer creation

# Check if this is a review workflow repository
if [ ! -f ".devcontainer/.review-workflow" ]; then
    exit 0
fi

echo "レビューワークフロー用リポジトリの pre-commit hook を設定中..."

cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

BRANCH=$(git symbolic-ref --short HEAD)

if [ "$BRANCH" = "main" ]; then
    echo "=========================================="
    echo "⚠️  警告: main ブランチにコミットしようとしています！"
    echo "=========================================="
    echo ""
    echo "ドラフトブランチ (xth-draft) に切り替えてください:"
    echo ""
    echo "コミットを中断しました。"
    exit 1
fi
EOF

chmod +x .git/hooks/pre-commit
echo "✅ Git pre-commit hook を設定しました"
