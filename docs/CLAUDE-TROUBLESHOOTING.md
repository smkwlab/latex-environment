# LaTeX Environment Troubleshooting Guide

This document provides troubleshooting information for common issues in latex-environment.

## Common Issues

### Container Build Fails
- Check texlive-ja-textlint image availability
- Verify Docker daemon is running
- Check devcontainer.json syntax

### LaTeX Compilation Errors
- Check .latexmkrc configuration
- Verify Japanese font availability
- Test with minimal document

### textlint Issues
- Validate .textlintrc syntax
- Check textlint rule compatibility
- Test with sample Japanese text

## Debug Commands

### Container Environment
```bash
# Check container environment
docker run --rm ghcr.io/smkwlab/texlive-ja-textlint:2025b platex --version

# Test LaTeX installation
docker run --rm ghcr.io/smkwlab/texlive-ja-textlint:2025b kpsewhich article.cls

# Check textlint rules
npx textlint --print-config
```

### Local Testing
```bash
# Test container build
docker build -f .devcontainer/Dockerfile .devcontainer/

# Test LaTeX compilation
latexmk main.tex
latexmk -c

# Test textlint
textlint *.tex
```

## Shell Command Gotchas

### Backticks in gh pr create/edit
When using `gh pr create` or `gh pr edit` with `--body`, backticks (`) in the body text are interpreted as command substitution by the shell. This causes errors like:
```
permission denied: .devcontainer/devcontainer.json
command not found: 2025c-test
```

**Solution**: Always escape backticks with backslashes when using them in PR bodies:
```bash
# Wrong - will cause errors
gh pr create --body "Updated `file.txt` to version `1.2.3`"

# Correct - escaped backticks
gh pr create --body "Updated \`file.txt\` to version \`1.2.3\`"
```

### Git Operations with Multiple Repositories
```bash
# Current repository operations
git status                    # latex-environment status
git add .devcontainer/

# Parent ecosystem operations
cd ..
git status                    # thesis-environment ecosystem status
./ecosystem-manager.sh status # All repositories status
```