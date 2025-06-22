# Document Quality Management

This document covers document quality standards and textlint usage for latex-environment.

## 📝 textlint Usage Guidelines

### Required Tools Setup
```bash
# Local environment setup (for maintainers)
npm install -g textlint
npm install -g textlint-rule-preset-ja-technical-writing
npm install -g textlint-rule-terminology
npm install -g textlint-plugin-latex2e
npm install -g textlint-plugin-html

# Or use Docker environment (recommended for users)
docker run --rm -v "$(pwd)":/workspace -w /workspace \
  ghcr.io/smkwlab/texlive-ja-textlint:2025e \
  /npm/node_modules/.bin/textlint README.md
```

### Document Quality Check Process

#### ✅ Recommended: Check Only
```bash
# Check Japanese documents before commits
textlint README.md
textlint CLAUDE.md
textlint *.md

# Check LaTeX documents
textlint *.tex
```

#### ❌ Prohibited: Automatic Fixes
```bash
# NEVER use automatic fixes
textlint --fix README.md  # FORBIDDEN
```

### Rationale for Manual-Only Fixes
- **Context Awareness**: Automatic fixes lack understanding of document context
- **Japanese Nuance**: Subtle Japanese language nuances require human judgment
- **Inappropriate Changes**: Auto-fix may add unnatural punctuation (e.g., colon handling)
- **Quality Assurance**: Manual review ensures appropriate corrections

## Document Quality Standards

### Japanese Documents
- **Writing Style**: Consistent である調 (dearu-chou) throughout
- **Sentence Length**: Maximum 100 characters per sentence
- **Particle Usage**: Avoid consecutive usage of same particles
- **Punctuation**: Proper 句点（。）usage at sentence endings
- **Technical Terms**: Follow terminology standards (JavaScript, GitHub, LaTeX, etc.)

### Mixed Language Documents
- **English Technical Documentation**: VERSIONS.md, CHANGELOG.md may exceed length limits
- **Code Examples**: Filtered out from textlint checks
- **URLs and Links**: Excluded from length and style checks

### Text Quality Standards
Configured textlint rules enforce:
- Maximum 8 consecutive kanji characters
- Maximum 100 characters per sentence
- Consistent writing style (dearu/desumasu)
- No doubled particles
- Institution names whitelist (e.g., 九州産業大学)

## Pre-commit Quality Checklist

Before committing changes to documentation:

1. **Run textlint check** on all modified .md and .tex files
2. **Review warnings manually** - do not auto-fix
3. **Fix issues by hand** preserving document intent and context
4. **Re-run textlint** to confirm resolution
5. **Commit only after** achieving clean textlint results

## Configuration Files

- **Primary Config**: `.textlintrc` (unified ecosystem standard)
- **Supported Formats**: HTML, Markdown, LaTeX
- **Override Rules**: Format-specific optimizations via overrides section

## Example Workflow
```bash
# 1. Edit document
vim README.md

# 2. Check quality
textlint README.md

# 3. Fix issues manually (if any)
vim README.md

# 4. Verify fixes
textlint README.md

# 5. Commit when clean
git add README.md
git commit -m "Update README with quality improvements"
```

## Contributing Guidelines

### Documentation
- **Run textlint check** before committing documentation changes
- Update CLAUDE.md for workflow changes
- Keep README.md user-focused
- Document breaking changes in CHANGELOG.md
- Update VERSIONS.md for compatibility changes