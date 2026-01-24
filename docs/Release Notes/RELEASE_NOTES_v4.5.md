# YouTube Keystrokes Blocker v4.5 Release Notes

**Release Date:** January 25, 2026
**Version:** 4.5.0

---

## 🎉 What's New

### Comprehensive Hotkey Coverage
YouTube Keystrokes Blocker now supports **30+ keyboard shortcuts** with independent toggle controls:

#### **Playback Controls** (5 hotkeys)
- **K** - Play/Pause
- **J** - Rewind 5 seconds
- **L** - Fast Forward 10 seconds
- **Shift+P** - Previous Video
- **Shift+N** - Next Video

#### **General Controls** (6 hotkeys)
- **F** - Fullscreen
- **T** - Theatre Mode
- **I** - Miniplayer
- **Esc** - Exit Fullscreen/Miniplayer
- **M** - Mute/Unmute
- **V** - Toggle Captions (Closed Captions)

#### **Captions & Subtitles** (5 hotkeys)
- **C** - Toggle Captions
- **O** - Text Opacity
- **W** - Window Opacity
- **+** - Increase Font Size
- **-** - Decrease Font Size

#### **Numeric & Seek** (10 hotkeys)
- **0-9** - Jump to percentage (0% = start, 9% = 90%)
- **Spacebar** - Play/Pause (alternative to K)

#### **Navigation** (4 hotkeys)
- **Arrow Left/Right** - Rewind/Fast Forward (5 seconds each)
- **Arrow Up/Down** - Volume Control (5% increments)
- **Ctrl+Left/Right** - Previous/Next Video

#### **Spherical Video** (8 hotkeys)
- **W/A/S/D** - Pan Up/Left/Down/Right
- **+** (Numpad) - Zoom In
- **-** (Numpad) - Zoom Out
- **]/[** - Zoom In/Out (keyboard)

#### **Advanced Features** (3 hotkeys)
- **Shift+/** - Open Keyboard Shortcuts Help
- **.** - Next Frame (while paused)
- **,** - Previous Frame (while paused)

#### **Speed Control** (2 hotkeys)
- **Shift+<** - Decrease Playback Speed
- **Shift+>** - Increase Playback Speed

---

## ✨ New Features

### 🎛️ Expandable Settings Panel
- **"Show more controls"** button reveals advanced options
- Scrollable content area prevents modal overflow
- Clean, organized layout with 11 main + 20 advanced options

### 🔘 Reset to Defaults Button
- One-click reset of all toggles to default settings
- Instantly reverts any configuration changes
- Works on all hotkey toggles including advanced section

### ⌨️ YouTube Shortcuts Button
- Direct access to YouTube's official keyboard shortcuts help
- Works even when Shift+/ hotkey is disabled
- Opens authentic YouTube shortcuts dialog

### ➡️ Split Arrow Controls
- **Left/Right Arrows** - Independent toggle for seek control
- **Up/Down Arrows** - Independent toggle for volume control
- **Ctrl+Arrows** - Separate toggle to preserve video navigation

### 🔧 Enhanced Settings Management
- Settings persist across page reloads
- Fresh state loaded on modal open (prevents stale checkboxes)
- Automatic merge with defaults ensures no missing keys
- Real-time synchronization on save

---

## 🐛 Critical Fixes

### Spacebar Detection (FIXED ✓)
**Issue:** Spacebar blocking sometimes failed to work
**Solution:** Hardened detection with multiple strategies:
- Checks `e.code === "Space"`
- Checks `e.key === " "`
- Checks `e.key === "Spacebar"`
- Checks `e.keyCode === 32`
- Listens to keydown/keypress/keyup events

### Settings Persistence (FIXED ✓)
**Issue:** Toggle changes weren't saved properly
**Solution:**
- Settings merged with defaults on load
- `persistSettings()` writes complete merged object
- Fresh `getSettings()` call on every keystroke

### Single-Key Hotkeys (FIXED ✓)
**Issue:** F, M, V keys were always active even when disabled
**Solution:** Each single-key hotkey now properly gated by its toggle (F/M/V/T/I/C/O)

### Modal Overflow (FIXED ✓)
**Issue:** Too many options caused modal to exceed screen height
**Solution:**
- Scrollable content area with `max-height: 60vh`
- Expandable "Show more" section
- Modal width increased to 420px

### Shift+/ Button Access (FIXED ✓)
**Issue:** Could not access YouTube shortcuts help when Shift+/ disabled
**Solution:**
- Button dispatches synthetic KeyboardEvent directly to document
- Bypasses hotkey handler logic
- Works independently of Shift+/ toggle state

---

## 📈 Improvements

### UI/UX Enhancements
- Modal width: 350px → 420px
- Consistent label formatting: `Feature Name (key)`
- Better button styling with hover feedback
- Version number displayed in settings header
- Improved visual hierarchy in expandable section

### Performance
- Optimized event listener setup (single listener instead of repeated)
- Fresh settings loaded only on keystroke + modal open (not every interaction)
- No memory leaks from event binding/unbinding

### Code Quality
- Clearer separation of concerns (defaults/handlers/UI)
- Better organized hotkey handler with grouped logic
- Comprehensive comments for advanced features
- Consistent error handling

---

## 🧪 Testing Performed

✅ **Playback Controls** - All K/J/L/Shift+P/Shift+N tested
✅ **Spacebar Detection** - Multiple event types verified
✅ **Settings Persistence** - Save→Reload→Open verified
✅ **Modal Scrolling** - Content overflow handled
✅ **Reset Button** - All toggles reset to defaults
✅ **Shift+/ Button** - Opens help even when disabled
✅ **Arrow Combinations** - Shift/Ctrl modifiers work correctly
✅ **Single-Key Hotkeys** - F/M/V/T/I/C/O properly toggle on/off

---

## 📦 Installation

### For Tampermonkey Users
1. Open [disable-yt-hotkeys.user.js](../../disable-yt-hotkeys.user.js)
2. Click "Install" in Tampermonkey
3. Refresh YouTube page
4. Settings button appears in video controls bar

### For Other Userscript Managers
Follow installation guide in [INSTALLATION.md](../INSTALLATION.md)

---

## 🛠️ Configuration

All settings are accessible from the **YouTube Keystrokes Blocker** button in video controls:

1. Check/uncheck hotkeys to disable/enable blocking
2. Click **"Show more controls"** to see advanced options
3. Use **"Reset to Defaults"** button to revert all changes
4. Click **"View Keyboard Shortcuts"** to see YouTube's official help
5. Click **"Save Settings"** to persist your preferences

---

## 🐛 Known Limitations

- **W Key Context:** Letter W is used for both caption opacity and spherical pan-up. Toggles are separate—disabling one doesn't affect the other.
- **Input Fields:** Hotkeys are NOT blocked when typing in text inputs, search bars, or chat (design feature)
- **Extension Compatibility:** Works with Tampermonkey, Greasemonkey, and Violentmonkey

---

## 🔄 Upgrade Path from v4.4

Simply install v4.5.0 over your existing version:
- **No manual configuration needed** - settings will migrate automatically
- **All previous settings preserved** - new hotkeys default to enabled
- **No breaking changes** - existing disabled hotkeys remain disabled

---

## 📞 Support & Feedback

Found an issue? Have a feature request?
Visit: [YouTube Keystrokes Blocker GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)

---

## 📋 Version History

| Version   | Release Date | Notes                                                              |
| --------- | ------------ | ------------------------------------------------------------------ |
| **4.5.0** | Jan 25, 2026 | Comprehensive hotkey coverage, expandable settings, critical fixes |
| 4.4.1     | Jan 24, 2026 | Button injection timing improvements                               |
| 4.3.0     | Jan 23, 2026 | Settings persistence, spacebar detection                           |

---

**Enjoy the v4.5 release!** 🎉
Your YouTube viewing experience just got more customizable.
