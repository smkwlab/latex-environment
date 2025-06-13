# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a general-purpose LaTeX environment template that provides a containerized development setup for Japanese academic documents. It uses VSCode devcontainers to ensure a consistent LaTeX compilation environment across all users.

## Key Commands

### LaTeX Compilation
```bash
# Primary compilation method (uses latexmk)
latexmk main.tex              # Compile main.tex to PDF
latexmk -pv main.tex          # Compile and view PDF
latexmk -c                    # Clean auxiliary files
latexmk -C                    # Clean all generated files including PDF

# Direct compilation (if needed)
platex main.tex               # Japanese LaTeX compilation
pbibtex main                  # Bibliography processing
dvipdfmx main.dvi            # Convert DVI to PDF
```

### Text Linting
```bash
# Check Japanese writing style
textlint *.tex                # Lint all .tex files
textlint --fix *.tex          # Auto-fix issues where possible
```

## Architecture

### Development Environment
The repository uses a Docker-based development container that automatically sets up:
- **TeXLive 2025** with full Japanese support (platex/uplatex)
- **textlint** for Japanese academic writing style checking
- **VSCode extensions**: LaTeX Workshop, GitHub Pull Requests, textlint

### Build System
- **latexmk**: Automated LaTeX compilation with dependency tracking
- **Configuration**: `.latexmkrc` defines the build process:
  - Default: platex → pbibtex → platex (×3) → dvipdfmx
  - Alternative: uplatex toolchain (commented out in config)
- **SyncTeX**: Bidirectional navigation between .tex source and PDF output

### CI/CD Workflow
- **GitHub Actions**: Automatically builds PDFs on:
  - Pull requests (for review)
  - Tags (for releases)
- **Action**: Uses `smkwlab/latex-release-action@v2.2.0`
- **Default target**: `main.tex` (configurable via `tex_file` input)

## File Structure Conventions

### Core Files
- `main.tex`: Default LaTeX document name expected by GitHub Actions
- `.latexmkrc`: LaTeX compilation configuration
- `.textlintrc`: Japanese text linting rules
- `.devcontainer/devcontainer.json`: Container environment setup

### VSCode Integration
- Auto-build on save (configurable in settings)
- SyncTeX keybindings:
  - **Ctrl+Alt+J** (Cmd+Option+J on Mac): Jump from .tex to PDF location
  - **Ctrl+Click** (Cmd+Click on Mac): Jump from PDF to .tex source
- External viewer support (Skim on macOS)

## Important Conventions

### Japanese Document Processing
- Uses **platex** by default (traditional Japanese LaTeX)
- **uplatex** available as alternative (Unicode-based)
- Character encoding: UTF-8
- Bibliography: pbibtex (Japanese-aware BibTeX)

### Text Quality Standards
Configured textlint rules enforce:
- Maximum 8 consecutive kanji characters
- Maximum 100 characters per sentence
- Consistent writing style (dearu/desumasu)
- No doubled particles
- Institution names whitelist (e.g., 九州産業大学)

### Repository Usage Pattern
This is a **template repository**. Users should:
1. Click "Use this template" on GitHub
2. Create a new repository for their document
3. Open in VSCode and reopen in container
4. Replace `main.tex` with their content
5. Customize `.latexmkrc` and `.textlintrc` as needed

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