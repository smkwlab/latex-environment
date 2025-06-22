# CLAUDE.md

General-purpose LaTeX environment template with containerized development setup for Japanese academic documents. Part of the thesis-environment ecosystem at Kyushu Sangyo University.

## Quick Start

### LaTeX Compilation
```bash
# Primary compilation method (uses latexmk)
latexmk main.tex              # Compile main.tex to PDF
latexmk -pv main.tex          # Compile and view PDF
latexmk -c                    # Clean auxiliary files
latexmk -C                    # Clean all generated files including PDF
```

### Text Linting
```bash
# Check Japanese writing style
textlint *.tex                # Lint all .tex files
textlint --fix *.tex          # Auto-fix issues where possible
```

### Development Environment
- **TeXLive 2025** with full Japanese support (platex/uplatex)
- **textlint** for Japanese academic writing style checking
- **VSCode devcontainer** with LaTeX Workshop and TeXLab
- **Base image**: `ghcr.io/smkwlab/texlive-ja-textlint:2025b`

## Key Files & Structure

```
.devcontainer/devcontainer.json    # Container environment setup
.latexmkrc                         # LaTeX compilation configuration
.textlintrc                        # Japanese text linting rules
main.tex                           # Default LaTeX document
VERSION                            # Version tracking (release branch)
```

## Branch Strategy

- **main**: Development branch with full management files
- **release**: Clean template branch for user consumption (students use this)
- **feature branches**: Development work, PR-based workflow

## Common Tasks

### Test Container Build
```bash
# Test container build
docker build -f .devcontainer/Dockerfile .devcontainer/

# Test LaTeX compilation
latexmk main.tex && latexmk -c
```

### Version Management
```bash
# Check current version
cat VERSION                   # Show current version (release branch only)
git describe --tags          # Show current tag version
```

### Template Usage
Students should:
1. Click "Use this template" on GitHub
2. Create a new repository for their document
3. Open in VSCode and reopen in container
4. Replace `main.tex` with their content

## Detailed Documentation

*Note: docs/ directory is excluded from release branch (student template)*

- **[Development Guide](docs/CLAUDE-DEVELOPMENT.md)** - Architecture, CI/CD, dependencies
- **[Troubleshooting](docs/CLAUDE-TROUBLESHOOTING.md)** - Common issues, debug commands
- **[Quality Management](docs/CLAUDE-QUALITY.md)** - textlint usage, document standards
