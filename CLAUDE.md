# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with the latex-environment repository.

## Repository Overview

This is a **general-purpose LaTeX environment template** that provides a containerized development setup for Japanese academic documents. It uses VSCode devcontainers to ensure a consistent LaTeX compilation environment across all users. This template is part of the thesis-environment ecosystem at Kyushu Sangyo University.

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

### Version Management
```bash
# Check current version
cat VERSION                   # Show current version (release branch only)
git describe --tags          # Show current tag version

# View compatibility info
cat VERSIONS.md               # View compatibility matrix
cat CHANGELOG.md              # View release history
```

### Development Commands
```bash
# Test container build
docker build -t test-latex .devcontainer/

# Validate devcontainer.json
code --install-extension ms-vscode-remote.remote-containers
```

## Architecture

### Development Environment
The repository uses a Docker-based development container that automatically sets up:
- **TeXLive 2025** with full Japanese support (platex/uplatex)
- **textlint** for Japanese academic writing style checking
- **VSCode extensions**: LaTeX Workshop, GitHub Pull Requests, textlint
- **Base image**: `ghcr.io/smkwlab/texlive-ja-textlint:2025b`

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

### Version Management System
- **VERSION file**: Tracks current version in release branch
- **VERSIONS.md**: Compatibility matrix with texlive-ja-textlint
- **CHANGELOG.md**: Release history and migration notes
- **Automated updates**: GitHub Actions manage version increments

## File Structure Conventions

### Core Files
- `main.tex`: Default LaTeX document name expected by GitHub Actions
- `.latexmkrc`: LaTeX compilation configuration
- `.textlintrc`: Japanese text linting rules
- `.devcontainer/devcontainer.json`: Container environment setup

### Management Files (main branch only)
- `VERSION`: Version tracking for release branch
- `VERSIONS.md`: Compatibility matrix
- `CHANGELOG.md`: Release history
- `DEPENDENCY-UPDATE.md`: Update procedures for maintainers

### VSCode Integration
- Auto-build on save (configurable in settings)
- SyncTeX keybindings:
  - **Ctrl+Alt+J** (Cmd+Option+J on Mac): Jump from .tex to PDF location
  - **Ctrl+Click** (Cmd+Click on Mac): Jump from PDF to .tex source
- External viewer support (Skim on macOS)

## Important Conventions

### Branch Strategy
- **main**: Development branch with full management files
- **release**: Clean template branch for user consumption
- **feature branches**: Development work, PR-based workflow

### Release Branch Management
The release branch contains only files needed by template users:

**Included in release branch:**
- README.md (usage instructions)
- .devcontainer/ (container configuration)
- .latexmkrc, .textlintrc (LaTeX settings)
- .github/workflows/autoassignees.yml (user workflow)
- .github/workflows/latex-build.yml (user workflow)
- VERSION (version tracking)

**Excluded from release branch:**
- CLAUDE.md (development-specific)
- VERSIONS.md, CHANGELOG.md (management docs)
- DEPENDENCY-UPDATE.md (maintenance procedures)
- Management workflows (check-texlive-updates.yml, create-release.yml)

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

## Development Workflow

### For Template Improvements
1. Work in main branch
2. Test changes in development environment
3. Update documentation as needed
4. Create PR for review

### For Dependency Updates
1. Check DEPENDENCY-UPDATE.md for procedures
2. Update .devcontainer/devcontainer.json with new image
3. Test compilation with sample documents
4. GitHub Actions will automatically create release

### For Version Management
1. Follow semantic versioning (MAJOR.MINOR.PATCH)
2. Update CHANGELOG.md for notable changes
3. VERSIONS.md compatibility matrix is manually maintained
4. Release creation is automated via GitHub Actions

## Testing Guidelines

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

### Integration Testing
- Test with both platex and uplatex workflows
- Verify VSCode extension functionality
- Test on multiple platforms (macOS, Windows WSL, Linux)
- Validate Japanese character handling

## Troubleshooting

### Common Issues

**Container build fails:**
- Check texlive-ja-textlint image availability
- Verify Docker daemon is running
- Check devcontainer.json syntax

**LaTeX compilation errors:**
- Check .latexmkrc configuration
- Verify Japanese font availability
- Test with minimal document

**textlint issues:**
- Validate .textlintrc syntax
- Check textlint rule compatibility
- Test with sample Japanese text

### Debug Commands
```bash
# Check container environment
docker run --rm ghcr.io/smkwlab/texlive-ja-textlint:2025b platex --version

# Test LaTeX installation
docker run --rm ghcr.io/smkwlab/texlive-ja-textlint:2025b kpsewhich article.cls

# Check textlint rules
npx textlint --print-config
```

## Ecosystem Integration

### Related Repositories
- **texlive-ja-textlint**: Base Docker image
- **sotsuron-template**: Uses this environment
- **latex-release-action**: CI/CD integration
- **aldc**: Deploys this environment

### Dependency Chain
```
texlive-ja-textlint (Docker image)
    ↓
latex-environment (this repository)
    ↓
Templates (sotsuron-template, wr-template, etc.)
```

### Version Coordination
- Monitor texlive-ja-textlint updates
- Test compatibility before releasing
- Update dependent templates as needed
- Coordinate with ecosystem maintainers

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

## Contributing Guidelines

### Code Quality
- Follow existing file structure conventions
- Test changes thoroughly before PR
- Update documentation for user-facing changes
- Maintain backward compatibility

### Documentation
- Update CLAUDE.md for workflow changes
- Keep README.md user-focused
- Document breaking changes in CHANGELOG.md
- Update VERSIONS.md for compatibility changes

### Review Process
- All changes require PR review
- Test in multiple environments
- Verify ecosystem integration
- Check automated workflow functionality