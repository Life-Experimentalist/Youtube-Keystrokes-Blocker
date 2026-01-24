# YouTube Keystrokes Blocker v4.4 Release Notes

**Release Date**: January 24, 2026
**Version**: 4.4
**Status**: Stable ✅

> **Related**: See [v4.3 Release Notes](./RELEASE_NOTES_v4.3.md) for previous release documentation

---

## 🎯 Critical Fix: Button Injection Timing Issue

### Problem
The hotkeys button was not appearing on the first page load when navigating to a YouTube video. Users had to refresh the page to see the button.

### Root Cause
Race condition between the userscript loading and YouTube's dynamic DOM construction. The script was trying to inject the button before YouTube's action button container was ready.

### Solution Implemented
1. **Event-Driven Architecture**: Added listeners for YouTube's SPA navigation events:
   - `yt-navigate-finish` - Fires when YouTube completes navigation
   - `yt-page-data-updated` - Fires when page data is updated

2. **Smart Waiting Logic**: Implemented exponential backoff retry mechanism that:
   - Waits for BOTH the video player AND actions container to be present
   - Uses increasing delays (100ms, 130ms, 169ms, ...) up to 20 attempts
   - Checks if we're on a watch page before attempting injection
   - Prevents duplicate injections

3. **Multiple Fallbacks**:
   - YouTube navigation events (primary)
   - MutationObserver (backup)
   - DOMContentLoaded event (initialization)

### Code Changes
- Replaced polling-based `setInterval` with async retry function
- Added proper YouTube SPA event handling
- Implemented exponential backoff for DOM element detection
- Better guard clauses to prevent duplicate button creation

### Result
✅ Button now appears reliably on first page load without refresh

---

## 🤖 Developer Experience Improvements

### Version Management Automation

Created comprehensive PowerShell scripts to automate versioning:

#### `scripts/Update-Version.ps1`
Updates version across all files automatically:
- `disable-yt-hotkeys.user.js` (@version tag)
- `MANIFEST.json` (version field)
- `README.md` (version badge)
- `CHANGELOG.md` (adds new entry)
- `package.json` (version field)

**Usage:**
```powershell
# Manual version
.\scripts\Update-Version.ps1 -NewVersion "4.5"

# Auto-increment
.\scripts\Update-Version.ps1 -Type patch  # 4.4 → 4.4.1
.\scripts\Update-Version.ps1 -Type minor  # 4.4 → 4.5
.\scripts\Update-Version.ps1 -Type major  # 4.4 → 5.0
```

#### `scripts/Release.ps1`
Automates the entire release process:
1. Validates git working tree is clean
2. Checks all required files exist
3. Validates userscript syntax
4. Creates git tag
5. Pushes to GitHub
6. Opens browser to create GitHub release

### NPM/UV Script Shortcuts

Added `package.json` with convenient shortcuts:
```json
{
  "scripts": {
    "version:major": "pwsh ./scripts/Update-Version.ps1 -Type major",
    "version:minor": "pwsh ./scripts/Update-Version.ps1 -Type minor",
    "version:patch": "pwsh ./scripts/Update-Version.ps1 -Type patch",
    "release": "pwsh ./scripts/Release.ps1"
  }
}
```

**Usage:**
```bash
npm run version:patch   # Quick version bump
npm run release         # Full release automation
```

### CI/CD Validation

Created GitHub Actions workflow (`.github/workflows/validate.yml`):
- ✅ Validates userscript file exists
- ✅ Checks JSON file syntax
- ✅ Verifies version consistency across all files
- ✅ Validates required userscript metadata
- ✅ Runs on push to main/develop and PRs

### Documentation

Created `scripts/README.md` with:
- Complete automation guide
- Workflow examples for different release types
- Troubleshooting section
- Version numbering standards

---

## 📊 Impact Summary

### User-Facing
- **Fixed**: Critical bug preventing button from appearing on first load
- **Improved**: Reliability and user experience
- **No breaking changes**: Fully backward compatible

### Developer-Facing
- **Automated**: Version management across 5 files
- **Automated**: Release process (git tagging, pushing)
- **Automated**: CI/CD validation
- **Documented**: Complete automation workflows

### Technical Metrics
- **Files changed**: 8
- **New files added**: 5 (scripts + workflow)
- **Code quality**: Improved error handling, better event-driven architecture
- **Maintainability**: Significantly improved with automation

---

## 🚀 Upgrade Path

Users on v4.3 or earlier will automatically receive v4.4 via:
- Greasy Fork auto-update
- Tampermonkey/Violentmonkey auto-update
- Manual update check

**No user action required** - updates are seamless and non-breaking.

---

## 📝 Next Steps for Developers

1. Review this release summary
2. Test the button injection on fresh YouTube page loads
3. Verify automation scripts work in your environment
4. Update any local development workflows to use new npm scripts

---

**Released**: January 24, 2026
**Version**: 4.4
**Author**: VKrishna04
**Organization**: Life Experimentalist
