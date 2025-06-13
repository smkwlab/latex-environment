# Version Compatibility Matrix

This document tracks the compatibility between latex-environment releases and texlive-ja-textlint versions.

## Version Mapping

| latex-environment | texlive-ja-textlint | TeXLive Year | Notes |
|------------------|---------------------|--------------|-------|
| v0.5.0 (current) | 2025b              | 2025         | Latest stable release |
| v0.4.1           | 2025a              | 2025         | Initial TeXLive 2025 support |
| v0.4.0           | 2023c              | 2023         | Last TeXLive 2023 version |
| v0.3.4           | 2023b              | 2023         | Stability improvements |
| v0.3.3           | 2023b              | 2023         | Bug fixes |
| v0.3.2           | 2023a              | 2023         | Initial TeXLive 2023 support |
| v0.3.1           | 2022               | 2022         | TeXLive 2022 final |
| v0.3.0           | 2022               | 2022         | Major refactoring |
| v0.2.x           | 2021               | 2021         | TeXLive 2021 series |
| v0.1.x           | 2020               | 2020         | Initial releases |

## Version Numbering Scheme

Starting from v0.5.0, latex-environment follows semantic versioning:

- **MAJOR (x.0.0)**: Breaking changes in environment structure or configuration
- **MINOR (0.x.0)**: TeXLive major version updates (e.g., 2023 → 2025)
- **PATCH (0.0.x)**: Bug fixes, documentation updates, minor configuration changes

## Migration Notes

### v0.4.x → v0.5.0
- Introduced version tracking system
- Added VERSION file to release branch
- Enhanced devcontainer.json with version comments
- No breaking changes for existing users

### v0.3.x → v0.4.x
- Updated to TeXLive 2025
- Changed from debian to alpine base image for smaller size
- Improved textlint configuration

### v0.2.x → v0.3.x
- Major refactoring of devcontainer configuration
- Added GitHub Actions workflow for automated releases
- Improved VSCode extension recommendations

## Determining Compatible Versions

To find which latex-environment version works with a specific texlive-ja-textlint version:

1. Check the table above for the recommended pairing
2. Look at the devcontainer.json in the release branch
3. Check the GitHub release notes for specific compatibility information

## Rollback Instructions

If you need to use an older version:

1. **For aldc users**: 
   ```bash
   # Currently not supported - aldc always uses latest release branch
   # Manual override required
   ```

2. **For direct GitHub template users**:
   - Navigate to specific release tag
   - Use "Use this template" from that tagged version
   
3. **For existing repositories**:
   - Update devcontainer.json image tag manually
   - Ensure .latexmkrc and .textlintrc are compatible

## Future Plans

- Implement automated compatibility testing
- Add version validation in GitHub Actions
- Consider supporting multiple texlive versions in single release
- Enhance aldc to support version selection