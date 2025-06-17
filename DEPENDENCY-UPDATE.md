# Dependency Update Process

This document describes how texlive-ja-textlint image updates are managed in this repository.

## Automated Update Process

A GitHub Actions workflow runs daily to check for new texlive-ja-textlint releases:

1. **Detection**: The workflow checks for new releases from `smkwlab/texlive-ja-textlint`
2. **PR Creation**: If a new version is found, an automated PR is created
3. **Review**: Manual review and testing of the update
4. **Release**: After merging, create a new release tag for this repository

## Manual Update Process

If automated updates fail or immediate update is needed:

1. Check latest release: https://github.com/smkwlab/texlive-ja-textlint/releases
2. Update `.devcontainer/devcontainer.json` with new image tag
3. Test the changes locally
4. Create PR with update
5. After merge, create new release tag

## Downstream Dependencies

After updating this repository, notify/update:

- **aldc**: Update `RELEASE` variable to new version
- **Template repositories**: May need workflow updates
- **Documentation**: Update any version references

## Dependency Chain

```
texlive-ja-textlint (Docker images)
    ↓
latex-environment (this repo - devcontainer.json)
    ↓
aldc (downloads latex-environment releases)
    ↓
Template repositories (use aldc for setup)
    ↓
Student repositories (created from templates)
```

## Version Naming Convention

- Use the same version tag as texlive-ja-textlint when possible
- If multiple updates for same texlive version, append letter (e.g., `2025b-a`)

## Testing Updates

Before merging updates:

1. Build devcontainer locally
2. Test basic LaTeX compilation
3. Verify textlint functionality
4. Check ARM64 compatibility if applicable