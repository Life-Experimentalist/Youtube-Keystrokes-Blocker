# Version Management Scripts

Automated tools for managing versions and releases of YouTube Keystrokes Blocker.

## 📜 Available Scripts

### Version Management

#### Using npm/uv scripts (Recommended):

```bash
# Bump patch version (4.3 → 4.3.1 or 4.3.1 → 4.3.2)
npm run version:patch

# Bump minor version (4.3 → 4.4)
npm run version:minor

# Bump major version (4.3 → 5.0)
npm run version:major

# Set specific version
npm run version:set 5.1
```

#### Using PowerShell directly:

```powershell
# Auto-increment patch version
.\scripts\Update-Version.ps1 -Type patch

# Auto-increment minor version
.\scripts\Update-Version.ps1 -Type minor

# Auto-increment major version
.\scripts\Update-Version.ps1 -Type major

# Set specific version
.\scripts\Update-Version.ps1 -NewVersion "4.4"
```

### Release Management

```bash
# Create a release (validates, tags, pushes to GitHub)
npm run release
```

Or directly with PowerShell:

```powershell
.\scripts\Release.ps1
```

### Build & Clean

```bash
# Build (validate userscript)
npm run build

# Clean temporary files
npm run clean

# Run tests
npm run test
```

## 🔄 Typical Workflow

### For a patch release (bug fix):

```bash
# 1. Make your bug fixes
# 2. Bump patch version
npm run version:patch

# 3. Update CHANGELOG.md with your changes
# 4. Commit everything
git add .
git commit -m "fix: resolved button timing issue"

# 5. Release
npm run release
```

### For a minor release (new features):

```bash
# 1. Develop new features
# 2. Bump minor version
npm run version:minor

# 3. Update CHANGELOG.md with your changes
# 4. Commit everything
git add .
git commit -m "feat: added new hotkey controls"

# 5. Release
npm run release
```

### For a major release (breaking changes):

```bash
# 1. Implement breaking changes
# 2. Bump major version
npm run version:major

# 3. Update CHANGELOG.md with breaking changes
# 4. Commit everything
git add .
git commit -m "feat!: redesigned settings interface"

# 5. Release
npm run release
```

## 📝 What Gets Updated

The `Update-Version.ps1` script automatically updates version numbers in:

- ✅ `disable-yt-hotkeys.user.js` - Userscript @version tag
- ✅ `MANIFEST.json` - version field
- ✅ `README.md` - version badge
- ✅ `CHANGELOG.md` - adds new version entry
- ✅ `package.json` - version field (if exists)

## 🚀 Release Process

The `Release.ps1` script automates:

1. ✅ Validates git working tree is clean
2. ✅ Checks all required files exist
3. ✅ Runs tests (if configured)
4. ✅ Validates userscript syntax
5. ✅ Creates git tag (v4.3, etc.)
6. ✅ Pushes commits and tags to GitHub
7. ✅ Opens browser to create GitHub release

## 🎯 Version Numbering

We follow [Semantic Versioning](https://semver.org/):

- **Major (X.0.0)**: Breaking changes, major redesigns
- **Minor (X.Y.0)**: New features, backward compatible
- **Patch (X.Y.Z)**: Bug fixes, small improvements

Examples:
- `4.3` → `4.4` (new feature)
- `4.3` → `4.3.1` (bug fix)
- `4.3` → `5.0` (breaking change)

## 🔧 Requirements

- PowerShell 7+ (pwsh)
- Git installed and configured
- npm or uv (optional, for script shortcuts)

## 📚 Additional Resources

- [CHANGELOG.md](../CHANGELOG.md) - Version history
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contribution guidelines
- [README.md](../README.md) - Project documentation

## 🆘 Troubleshooting

**Error: "Execution of scripts is disabled"**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Error: "Could not find current version"**
- Ensure `disable-yt-hotkeys.user.js` has `@version` tag
- Check version format is `X.Y` or `X.Y.Z`

**Error: "Tag already exists"**
- Delete tag: `git tag -d v4.3 && git push origin :refs/tags/v4.3`
- Or use Release.ps1 which handles this automatically

---

**Made with ❤️ by [VKrishna04](https://github.com/VKrishna04) | [Life Experimentalist](https://github.com/Life-Experimentalist)**
