# LaTeX Environment Development Guide

This document provides detailed development guidance for latex-environment.

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