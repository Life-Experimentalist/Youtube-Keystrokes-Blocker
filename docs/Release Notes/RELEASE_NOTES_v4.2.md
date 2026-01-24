# Release Notes - Version 4.2

**Release Date:** January 20, 2026

## 🎨 UI Enhancements

This release focuses on improving the user interface for better readability and visual polish.

### Text Readability Improvements

**Increased Font Sizes:**
- Header title: 16px → **18px**
- Close button: 24px → **28px**
- Setting labels: now **15px** (previously inherited default)
- Save button: 14px → **15px**

The modal text is now significantly more readable, especially on high-resolution displays.

### Visual Refinements

**Save Button Polish:**
- Border radius increased from 2px to **8px** for softer, more modern appearance
- Padding enhanced: 8px 16px → **10px 18px** for better button proportions
- Maintains YouTube red (#ff0033) branding with hover effects

**Flexible Modal Layout:**
- Removed fixed height constraint (`max-height: 400px`)
- Eliminated scrollbar for cleaner appearance
- Modal now dynamically expands to fit all settings options
- Better user experience with full content visibility

## 📊 Impact

These changes make the settings interface:
- ✅ **More accessible** - larger text is easier to read
- ✅ **More polished** - rounded corners match modern design trends
- ✅ **More usable** - no scrolling required to see all options
- ✅ **More consistent** - better alignment with YouTube's design language

## 🔄 Upgrade Path

Users will automatically receive this update through:
- **Greasy Fork:** Daily automatic checks
- **GitHub:** Manual update or userscript manager auto-update

No configuration changes required - existing settings are preserved.

## 🐛 Bug Fixes

None in this release (focused on UI polish).

## 📝 Technical Details

**Files Modified:**
- `disable-yt-hotkeys.user.js` (version bump + CSS updates)
- `README.md` (version badge update)
- `CHANGELOG.md` (version history entry)

**CSS Changes:**
```css
/* Before */
.yt-hk-header h2 { font-size: 16px; }
.yt-hk-close { font-size: 24px; }
.yt-hk-row { padding: 10px 20px; }
.yt-hk-save-btn { font-size: 14px; padding: 8px 16px; border-radius: 2px; }
.yt-hk-content { max-height: 400px; overflow-y: auto; }

/* After */
.yt-hk-header h2 { font-size: 18px; }
.yt-hk-close { font-size: 28px; }
.yt-hk-row { padding: 12px 20px; font-size: 15px; }
.yt-hk-save-btn { font-size: 15px; padding: 10px 18px; border-radius: 8px; }
.yt-hk-content { padding: 10px 0; }
```

## 🎯 Next Steps

Future enhancements under consideration:
- Keyboard shortcuts for settings modal
- Import/export settings profiles
- Preset configurations for common use cases
- Enhanced animations and transitions

---

**Full Changelog:** [CHANGELOG.md](../CHANGELOG.md)
**Installation:** [Greasy Fork](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page) | [GitHub](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker)
