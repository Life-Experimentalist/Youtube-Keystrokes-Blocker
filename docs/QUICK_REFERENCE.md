# Developer Quick Reference

> Fast-access guide for common development tasks

---

## 📦 Version Management (Quickest Way)

```bash
# Bump patch version (4.4 → 4.4.1)
npm run version:patch

# Bump minor version (4.4 → 4.5)
npm run version:minor

# Bump major version (4.4 → 5.0)
npm run version:major

# Create a full release
npm run release
```

---

## 🔄 Full Release Workflow

```bash
# 1. Make your changes and commit
git commit -m "feat: description of change"

# 2. Bump version (automatically updates all files)
npm run version:minor

# 3. Update CHANGELOG.md with your specific changes
# Edit CHANGELOG.md to replace placeholder entries

# 4. Commit the version bump
git add .
git commit -m "chore: bump version to 4.5"

# 5. Create release (tags, pushes, opens GitHub)
npm run release

# 6. Create GitHub release and upload files
# (Browser opens automatically)
```

---

## 🧪 Testing Before Release

```bash
# Run tests
npm run test

# Validate syntax
npm run build

# Clean temporary files
npm run clean
```

---

## 📝 What Gets Updated Automatically

When you run `npm run version:patch/minor/major`:

```
✅ disable-yt-hotkeys.user.js  (@version tag)
✅ MANIFEST.json               (version field)
✅ package.json                (version field)
✅ README.md                   (version badge)
✅ CHANGELOG.md                (new entry)
```

---

## 📂 File Locations

```
YouTube Keystrokes Blocker/
├── disable-yt-hotkeys.user.js    # Main script
├── MANIFEST.json                 # Metadata
├── package.json                  # NPM config
├── README.md                     # Documentation
├── CHANGELOG.md                  # Version history
├── scripts/
│   ├── Update-Version.ps1        # Version automation
│   ├── Release.ps1               # Release automation
│   └── README.md                 # Script documentation
├── docs/
│   ├── RELEASE_NOTES_v4.4.md     # Latest release
│   ├── RELEASE_NOTES_v4.3.md     # Previous release
│   ├── RELEASES.md               # Release index
│   ├── DEVELOPMENT.md            # Dev guide
│   └── ...
└── .github/
    └── workflows/
        └── validate.yml          # CI/CD
```

---

## 🚀 Common Commands

```powershell
# Update to latest version in source
git pull origin main

# Checkout specific version tag
git checkout tags/v4.4

# List all version tags
git tag -l

# Create new branch for feature
git checkout -b feature/new-feature

# Push changes
git push origin main

# Push tags
git push origin --tags
```

---

## 🐛 Debugging Tips

### Check version in userscript
```javascript
// In browser console on YouTube
GM_info.script.version  // Returns current version
```

### Check settings
```javascript
// In browser console
JSON.parse(localStorage.getItem('hotkeySettings'))
```

### Force update (Tampermonkey)
```
Tampermonkey menu → Check for user script updates
```

---

## 📊 Version Format

We follow **Semantic Versioning**:

```
MAJOR.MINOR.PATCH
  4  .  4  .  0
  ↓     ↓     ↓
Breaking API   Bug
changes       Changes   Fixes
```

**Examples**:
- `4.4` → New features (minor)
- `4.4.1` → Bug fix (patch)
- `5.0` → Breaking changes (major)

---

## 🔐 Release Checklist

Before running `npm run release`:

- [ ] All changes committed
- [ ] CHANGELOG.md updated
- [ ] Tests passing (`npm run test`)
- [ ] Syntax valid (`npm run build`)
- [ ] Version bumped (`npm run version:*`)
- [ ] Working tree clean (`git status`)

---

## 🆘 Troubleshooting

### Error: "Execution of scripts is disabled"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Version not updating in file X
- Check file exists and is in the correct path
- Verify file format (JSON, JS, Markdown)
- Run script with `-Verbose` flag for details

### Release fails at git push
- Verify git is configured correctly
- Check you have push permissions
- Ensure no uncommitted changes exist

### Button not appearing on first load (for testing)
- Open incognito window
- Navigate to YouTube watch page
- Wait ~2-3 seconds (event-driven retry)
- Check console for error messages

---

## 📚 Documentation

- **Development**: [docs/DEVELOPMENT.md](../docs/DEVELOPMENT.md)
- **Contributing**: [CONTRIBUTING.md](../CONTRIBUTING.md)
- **Scripts**: [scripts/README.md](../scripts/README.md)
- **Releases**: [docs/RELEASES.md](../docs/RELEASES.md)
- **Changelog**: [CHANGELOG.md](../CHANGELOG.md)

---

## 🔗 Useful Links

- **Repository**: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker
- **Greasy Fork**: https://greasyfork.org/en/scripts/563265
- **Issues**: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues
- **Author**: https://vkrishna04.me

---

**Quick Tip**: Bookmark this page for easy access during development! 🔖

Last updated: January 24, 2026
