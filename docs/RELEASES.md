# Release Notes & Version Documentation

Complete release documentation for YouTube Keystrokes Blocker

## 📋 Latest Release

### [v4.4 - January 24, 2026](./Release%20Notes/RELEASE_NOTES_v4.4.md) ⭐ **CURRENT**

**Critical bug fix** - Button now appears reliably on first page load without refresh

**Key Features**:
- ✅ Fixed race condition in button injection
- ✅ Event-driven architecture with YouTube SPA support
- ✅ Exponential backoff retry logic
- ✅ Automated version management scripts
- ✅ GitHub Actions CI/CD validation

[Read Full Release Notes →](./Release%20Notes/RELEASE_NOTES_v4.4.md)

---

## 📚 Previous Releases

### [v4.3 - January 23, 2026](./Release%20Notes/RELEASE_NOTES_v4.3.md)

**Enhancement release** - Settings management improvements and better hotkey detection

**Key Features**:
- ✅ Smart settings reloading with real-time synchronization
- ✅ Enhanced hotkey detection for spacebar and F/M keys
- ✅ Visual feedback when settings are saved
- ✅ Multi-selector injection with fallbacks
- ✅ Manifest v3.0 support
- ✅ Updated distribution URLs

[Read Full Release Notes →](./Release%20Notes/RELEASE_NOTES_v4.3.md)

---

### [v4.2 - January 20, 2026](./Release%20Notes/RELEASE_NOTES_v4.2.md)

**UI Enhancement** - Improved modal readability and styling

**Changes**:
- Larger font sizes in settings modal
- Enhanced button styling with rounded corners
- Removed modal scrollbars
- Better visual hierarchy

[Read Full Release Notes →](./Release%20Notes/RELEASE_NOTES_v4.2.md)

---

### [v4.1 - Prior Release](./Release%20Notes/RELEASE_NOTES_v4.1.md)

YouTube-native design with Greasy Fork integration

[Read Full Release Notes →](./Release%20Notes/RELEASE_NOTES_v4.1.md)

---

## 🔄 Version Timeline

```
v4.4 (2026-01-24) ⭐ CURRENT
  ↑ Critical timing fix
v4.3 (2026-01-23)
  ↑ Settings improvements
v4.2 (2026-01-20)
  ↑ UI enhancements
v4.1 (Earlier)
  ↑ Initial modern design
```

---

## 📖 How to Read Release Notes

Each release note document includes:

1. **Overview** - What the release is about
2. **New Features** - What was added
3. **Technical Improvements** - How things changed under the hood
4. **Bug Fixes** - What was fixed
5. **Upgrade Instructions** - How to get the update
6. **Known Issues** - Limitations or known problems
7. **Quality Checklist** - Testing and validation done

---

## 🚀 Upgrade Guide

### Automatic Updates
- **Greasy Fork**: Updates deliver automatically within 24 hours
- **Tampermonkey/Violentmonkey**: Auto-check via extension settings
- **Brave/Vivaldi**: Built-in userscript managers auto-update

### Manual Update
Visit the [Greasy Fork script page](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page) and click "Install this script"

### From Source
```bash
git pull origin main
# or checkout specific version
git checkout tags/v4.4
```

---

## ❓ FAQ

### Q: Will my settings be preserved when I update?
**A**: Yes! All versions are backward compatible. Your settings will be automatically preserved.

### Q: What if I have an old version, should I update?
**A**: Yes, recommended! Each new version includes improvements and bug fixes. Updates are non-breaking and seamless.

### Q: Can I downgrade to an older version?
**A**: You can, but not recommended. Newer versions are always more compatible with current YouTube. Use `git checkout tags/vX.Y` if needed.

### Q: What's the difference between patch, minor, and major versions?
- **Patch** (4.4.1): Bug fixes and small improvements
- **Minor** (4.5): New features, fully backward compatible
- **Major** (5.0): Breaking changes or major redesigns

---

## 📞 Support & Feedback

- 🐛 **Report Issues**: [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)
- ⭐ **Feature Requests**: Create an issue with `[Feature Request]` tag
- 📧 **Contact**: hello@vkrishna04.me

---

## 🔗 Related Documentation

- [CHANGELOG.md](../CHANGELOG.md) - Detailed changelog
- [README.md](../README.md) - Project documentation
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contributing guidelines
- [scripts/README.md](../scripts/README.md) - Version automation guide

---

## 📊 Version Support Matrix

| Version | Release Date | Status   | Support         |
| ------- | ------------ | -------- | --------------- |
| 4.4     | 2026-01-24   | Stable ✅ | Active          |
| 4.3     | 2026-01-23   | Stable ✅ | Active          |
| 4.2     | 2026-01-20   | Stable ✅ | Supported       |
| 4.1     | Earlier      | Legacy   | Limited         |
| 4.0     | Much Earlier | Obsolete | ⚠️ Not Supported |

---

**Last Updated**: January 24, 2026
**Current Version**: 4.4
**Status**: Active Development ✅

Made with ❤️ by [VKrishna04](https://github.com/VKrishna04) | [Life Experimentalist](https://github.com/Life-Experimentalist)
