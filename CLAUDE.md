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
- **TeXLab** for advanced LaTeX language support and real-time syntax checking
- **VSCode extensions**: LaTeX Workshop, TeXLab, GitHub Pull Requests, textlint
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
- **Real-time syntax checking** via TeXLab
- **Intelligent code completion** for LaTeX commands and environments
- **Auto-build on save** (configurable in settings)
- **SyncTeX keybindings**:
  - **Ctrl+Alt+J** (Cmd+Option+J on Mac): Jump from .tex to PDF location
  - **Ctrl+Click** (Cmd+Click on Mac): Jump from PDF to .tex source
- **External viewer support** (Skim on macOS)
- **Diagnostics** for syntax errors, warnings, and style issues

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

#### Core Infrastructure
- **texlive-ja-textlint**: Base Docker image with LaTeX + textlint
- **latex-release-action**: GitHub Action for automated LaTeX compilation
- **aldc**: Command-line tool for deploying this environment

#### Templates Using This Environment
- **sotsuron-template**: Unified thesis template (undergraduate/graduate)
- **ise-report-template**: Information Science Exercise HTML reports with textlint
- **wr-template**: Weekly report template
- **latex-template**: Basic LaTeX template
- **sotsuron-report-template**: Report template for thesis work

#### Supporting Tools
- **ai-academic-paper-reviewer**: AI-powered academic paper review GitHub Action
- **thesis-management-tools**: Administrative tools and workflows

### Dependency Chain
```
texlive-ja-textlint (Docker base)
    ↓
latex-environment (this repository - DevContainer template)
    ↓
├── sotsuron-template (LaTeX thesis)
├── ise-report-template (HTML reports with textlint)
├── wr-template (Weekly reports)
├── latex-template (Basic LaTeX)
└── sotsuron-report-template (Thesis reports)

Supporting Infrastructure:
├── latex-release-action → (Used by LaTeX templates)
├── ai-academic-paper-reviewer → (Used by thesis repos)
├── aldc → (Deploys this environment)
└── thesis-management-tools → (Management workflows)
```

### Version Coordination
- Monitor texlive-ja-textlint updates
- Test compatibility before releasing
- Update dependent templates as needed
- Coordinate with ecosystem maintainers

## MCP Tools Usage

### GitHub Operations
Use MCP tools instead of `gh` command for GitHub operations:
- **Development**: Use `mcp__gh-toshi__*` tools for development work
- **Student testing**: Use `mcp__gh-k19__*` tools only when testing student workflows

### Shell Command Gotchas

#### Backticks in gh pr create/edit
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

## Document Quality Management

### 📝 textlint Usage Guidelines

#### Required Tools Setup
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

#### Document Quality Check Process

##### ✅ Recommended: Check Only
```bash
# Check Japanese documents before commits
textlint README.md
textlint CLAUDE.md
textlint *.md

# Check LaTeX documents
textlint *.tex
```

##### ❌ Prohibited: Automatic Fixes
```bash
# NEVER use automatic fixes
textlint --fix README.md  # FORBIDDEN
```

#### Rationale for Manual-Only Fixes
- **Context Awareness**: Automatic fixes lack understanding of document context
- **Japanese Nuance**: Subtle Japanese language nuances require human judgment
- **Inappropriate Changes**: Auto-fix may add unnatural punctuation (e.g., colon handling)
- **Quality Assurance**: Manual review ensures appropriate corrections

#### Document Quality Standards

##### Japanese Documents
- **Writing Style**: Consistent である調 (dearu-chou) throughout
- **Sentence Length**: Maximum 100 characters per sentence
- **Particle Usage**: Avoid consecutive usage of same particles
- **Punctuation**: Proper 句点（。）usage at sentence endings
- **Technical Terms**: Follow terminology standards (JavaScript, GitHub, LaTeX, etc.)

##### Mixed Language Documents
- **English Technical Documentation**: VERSIONS.md, CHANGELOG.md may exceed length limits
- **Code Examples**: Filtered out from textlint checks
- **URLs and Links**: Excluded from length and style checks

#### Pre-commit Quality Checklist

Before committing changes to documentation:

1. **Run textlint check** on all modified .md and .tex files
2. **Review warnings manually** - do not auto-fix
3. **Fix issues by hand** preserving document intent and context
4. **Re-run textlint** to confirm resolution
5. **Commit only after** achieving clean textlint results

#### Configuration Files

- **Primary Config**: `.textlintrc` (unified ecosystem standard)
- **Supported Formats**: HTML, Markdown, LaTeX
- **Override Rules**: Format-specific optimizations via overrides section

### Example Workflow
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

### Code Quality
- Follow existing file structure conventions
- Test changes thoroughly before PR
- Update documentation for user-facing changes
- Maintain backward compatibility

### Documentation
- **Run textlint check** before committing documentation changes
- Update CLAUDE.md for workflow changes
- Keep README.md user-focused
- Document breaking changes in CHANGELOG.md
- Update VERSIONS.md for compatibility changes

### Review Process
- All changes require PR review
- Test in multiple environments
- Verify ecosystem integration
- Check automated workflow functionality

## Security and Permission Guidelines

### 🚨 CRITICAL: GitHub Administration Rules

#### Git and GitHub Operations
- **NEVER use `--admin` flag** with `gh pr merge` or similar commands
- **NEVER bypass Branch Protection Rules** without explicit user permission
- **ALWAYS respect the configured workflow**: approval process, status checks, etc.

#### When Branch Protection Blocks Operations
1. **Report the situation** to user with specific error message
2. **Explain available options**:
   - Wait for required approvals
   - Wait for status checks to pass
   - Use `--auto` flag for automatic merge after requirements met
   - Request explicit permission for admin override (emergency only)
3. **Wait for user instruction** - never assume intent

#### Proper Error Handling Example
```bash
# When this fails:
gh pr merge 90 --squash --delete-branch
# Error: Pull request is not mergeable: the base branch policy prohibits the merge

# CORRECT response:
echo "Branch Protection Rules prevent merge. Options:"
echo "1. Wait for required approvals (currently need: 1)"
echo "2. Wait for status checks (currently pending: build-and-release-pdf)"
echo "3. Use --auto to merge automatically when requirements met"
echo "4. Request admin override (emergency only)"
echo "Please specify how to proceed."

# WRONG response:
gh pr merge 90 --squash --delete-branch --admin  # NEVER DO THIS
```

#### Emergency Admin Override
- Only use `--admin` flag when explicitly requested by user
- Document the reason for override in commit/PR description
- Report the action taken and why it was necessary

### Rationale
Branch Protection Rules exist to:
- Ensure code quality through required reviews
- Prevent accidental breaking changes
- Maintain audit trail of changes
- Enforce consistent development workflow

Bypassing these rules undermines repository security and development process integrity.