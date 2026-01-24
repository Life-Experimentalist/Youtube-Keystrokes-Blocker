# Project Structure & Documentation Guide

Complete guide to the YouTube Keystrokes Blocker repository

---

## 📁 Repository Structure

```
YouTube Keystrokes Blocker/
│
├── 📄 Core Files
│   ├── disable-yt-hotkeys.user.js    ⭐ Main userscript (443 lines)
│   ├── MANIFEST.json                 🔧 Extension metadata
│   ├── package.json                  📦 NPM configuration
│   └── LICENSE.md                    ⚖️  Apache 2.0 License
│
├── 📖 Documentation (Root Level)
│   ├── README.md                     📝 Main project documentation
│   ├── CHANGELOG.md                  📋 Complete version history
│   ├── CONTRIBUTING.md               🤝 Contribution guidelines
│   ├── QUICK_REFERENCE.md            ⚡ Developer quick start
│   └── COMPLETE_OVERVIEW.md          📊 Project overview
│
├── 📂 docs/ - Extended Documentation
│   ├── RELEASES.md                   📚 Release index & FAQ
│   ├── RELEASE_NOTES_v4.4.md         ✨ Latest release (v4.4)
│   ├── RELEASE_NOTES_v4.3.md         📝 Previous release (v4.3)
│   ├── RELEASE_NOTES_v4.2.md         📝 Archive release
│   ├── RELEASE_NOTES_v4.1.md         📝 Archive release
│   ├── DEVELOPMENT.md                🔨 Development guide
│   ├── FAQ.md                        ❓ Frequently asked questions
│   ├── INSTALLATION.md               🔧 Installation instructions
│   └── USAGE.md                      📘 User guide
│
├── 📂 scripts/ - Automation Tools
│   ├── Update-Version.ps1            🔄 Version bumping automation
│   ├── Release.ps1                   🚀 Release automation
│   └── README.md                     📚 Automation documentation
│
├── 📂 .github/ - GitHub Configuration
│   ├── workflows/
│   │   └── validate.yml              ✅ CI/CD validation pipeline
│   └── (other GitHub config)
│
└── 📂 Other Config Files
    ├── _config.yml                   ⚙️  Jekyll/GitHub Pages config
    ├── CNAME                         🌐 Custom domain
    └── (build/deployment files)
```

---

## 📚 Documentation Map

### For Users
**Start Here** → [README.md](../README.md)
1. First, read: Features, Installation, Usage
2. Then, check: FAQ in [docs/FAQ.md](../docs/FAQ.md)
3. Need help?: [docs/INSTALLATION.md](../docs/INSTALLATION.md), [docs/USAGE.md](../docs/USAGE.md)

### For Developers
**Start Here** → [QUICK_REFERENCE.md](QUICK_REFERENCE.md)
1. First: Version management quick start
2. Then: [docs/DEVELOPMENT.md](../docs/DEVELOPMENT.md) for setup
3. Reference: [scripts/README.md](../scripts/README.md) for automation tools

### For Release Managers
**Start Here** → [docs/RELEASES.md](../docs/RELEASES.md)
1. Overview of all releases
2. Specific release notes (v4.4, v4.3, etc.)
3. Upgrade instructions and support matrix

### For Contributors
**Start Here** → [CONTRIBUTING.md](../CONTRIBUTING.md)
1. Code of conduct
2. How to report issues
3. How to submit pull requests

---

## 🔄 File Purpose & Updates

### Core Userscript (`disable-yt-hotkeys.user.js`)
- **Purpose**: The actual userscript that blocks YouTube hotkeys
- **Size**: ~13.5 KB
- **Update Frequency**: With new features/fixes
- **Version Location**: Line 4 (`// @version`)
- **Edit**: Manually or via `npm run version:*`

### Metadata (`MANIFEST.json`)
- **Purpose**: Extension metadata for various platforms
- **Update Frequency**: With version bumps
- **Auto-Updated**: Yes (version scripts)
- **Manual Edits**: Only for non-version changes

### Package Config (`package.json`)
- **Purpose**: NPM scripts and project metadata
- **Update Frequency**: With version bumps + dependency changes
- **Auto-Updated**: Yes (version scripts)
- **Scripts Available**: `version:patch`, `version:minor`, `version:major`, `release`

### README (`README.md`)
- **Purpose**: Main documentation, getting started
- **Update Frequency**: With major changes
- **Auto-Updated**: Yes (version badge only)
- **Manual Edits**: Features, installation, usage sections

### CHANGELOG (`CHANGELOG.md`)
- **Purpose**: Detailed version history
- **Update Frequency**: With every release
- **Auto-Updated**: Partial (version structure)
- **Manual Edits**: Specific change descriptions

---

## 🎯 Workflow Guides

### Making a Change
1. Create feature branch: `git checkout -b feature/description`
2. Make your changes to `disable-yt-hotkeys.user.js`
3. Test thoroughly (YouTube video page)
4. Commit: `git commit -m "feat: description"`
5. Push: `git push origin feature/description`
6. Create Pull Request on GitHub

### Releasing a Version
1. **Bump Version**: `npm run version:minor` (or patch/major)
2. **Update CHANGELOG**: Add specific changes to v4.X entry
3. **Commit**: `git add . && git commit -m "chore: bump to 4.5"`
4. **Release**: `npm run release`
5. **Create Release**: GitHub Actions or manual (opens browser)

### Handling Bug Reports
1. Check [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
2. Create branch: `git checkout -b fix/issue-number`
3. Fix the bug
4. Test thoroughly
5. Follow "Release" workflow with type: **patch**

---

## 🔗 Cross-References

### Documentation Dependencies
```
README.md
  ├─ Refers to → CHANGELOG.md
  ├─ Refers to → docs/INSTALLATION.md
  ├─ Refers to → docs/USAGE.md
  └─ Refers to → scripts/README.md

CHANGELOG.md
  ├─ Refers to → docs/RELEASE_NOTES_v4.X.md
  └─ Refers to → docs/RELEASES.md

scripts/README.md
  ├─ Refers to → CHANGELOG.md
  └─ Refers to → package.json

docs/RELEASES.md
  ├─ Refers to → docs/RELEASE_NOTES_v4.X.md
  └─ Refers to → CHANGELOG.md
```

### File Update Cascade
When you bump the version:
```
npm run version:minor
       ↓
Update-Version.ps1 runs
       ↓
Updates FIVE files:
  1. disable-yt-hotkeys.user.js (@version tag)
  2. MANIFEST.json (version field)
  3. README.md (badge)
  4. package.json (version)
  5. CHANGELOG.md (entry)
```

---

## 📊 Statistics

### Code Metrics
- **Main Script**: ~443 lines
- **File Size**: ~13.5 KB
- **GitHub Lines**: 1,000+ (with docs)
- **Documentation Pages**: 15+
- **Supported Languages**: 1 (English)

### Version History
- **Latest Version**: 4.4 (2026-01-24)
- **Release Frequency**: ~1-2 per week
- **Oldest Supported**: v4.0+
- **Total Versions**: 4 major releases

### Browser Support
- ✅ Chrome 70+
- ✅ Firefox 60+
- ✅ Edge 79+
- ✅ Opera 57+
- ✅ Safari 13+
- ✅ Vivaldi 2.0+
- ✅ Brave 1.0+

---

## 🛠️ Tools & Technologies

### Development
- **Language**: JavaScript (ES6+)
- **Userscript Manager**: Tampermonkey, Greasemonkey, Violentmonkey
- **Distribution**: Greasy Fork, GitHub

### Automation
- **Scripting**: PowerShell 5.1+
- **Package Manager**: npm, uv
- **Version Control**: Git
- **CI/CD**: GitHub Actions

### Documentation
- **Format**: Markdown
- **Hosting**: GitHub (with GitHub Pages)
- **Version Control**: Git

---

## 🔐 Security & Compliance

### Code Security
- ✅ No external dependencies
- ✅ No malicious code
- ✅ Open source (Apache 2.0)
- ✅ Community reviewed

### Data Privacy
- ✅ No data collection
- ✅ Local storage only (browser)
- ✅ No tracking
- ✅ No external calls (except YouTube)

---

## 🎯 Key Directories

| Path       | Purpose       | Contents                       |
| ---------- | ------------- | ------------------------------ |
| `/`        | Root          | Core script, config, main docs |
| `docs/`    | Extended docs | Release notes, guides, FAQ     |
| `scripts/` | Automation    | Version & release scripts      |
| `.github/` | GitHub config | Workflows, actions             |

---

## 📞 Support Resources

- **Documentation**: [README.md](../README.md)
- **Issues**: [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)
- **Quick Help**: [QUICK_REFERENCE.md](../QUICK_REFERENCE.md)
- **Contact**: hello@vkrishna04.me

---

## ✅ Checklist for New Contributors

- [ ] Read [CONTRIBUTING.md](../CONTRIBUTING.md)
- [ ] Read [QUICK_REFERENCE.md](../QUICK_REFERENCE.md)
- [ ] Review [docs/DEVELOPMENT.md](../docs/DEVELOPMENT.md)
- [ ] Check [README.md](../README.md) for context
- [ ] Review [CHANGELOG.md](../CHANGELOG.md) for recent work
- [ ] Set up your development environment
- [ ] Make your first contribution!

---

**Last Updated**: January 24, 2026
**Current Version**: 4.4
**Status**: Actively Maintained ✅

Made with ❤️ by [VKrishna04](https://github.com/VKrishna04) | [Life Experimentalist](https://github.com/Life-Experimentalist)
