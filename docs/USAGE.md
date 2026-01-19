# Usage Guide

## Quick Start

1. **Install the script** following the [Installation Guide](INSTALLATION.md)
2. **Visit YouTube** and play any video
3. **Look for the keyboard icon (⌨️)** in the player controls
4. **Click to open settings**
5. **Toggle switches** to customize which hotkeys are blocked
6. **Click "Save Changes"**

---

## Accessing Settings

### Method 1: Player Button (Recommended)
1. Play a YouTube video
2. Look at the video player controls (bottom-right)
3. Find the **keyboard icon (⌨️)**
4. Click it to open the settings modal

### Method 2: Userscript Manager Menu
1. Click your userscript manager icon (top-right of browser)
2. Look for "YouTube Hotkey Settings"
3. Click to open the settings

---

## Understanding the Settings Modal

The settings modal appears as a dark panel with:
- **Header:** "Hotkey Settings" with a close button (×)
- **Toggle switches:** Each hotkey has an ON/OFF toggle
- **Save button:** Click to apply your changes

### Toggle Meanings
- **🟢 ON (Active)** = The hotkey is **BLOCKED** on YouTube
- **⚫ OFF (Inactive)** = The hotkey **WORKS NORMALLY** on YouTube

---

## Available Hotkeys

### 1. Numbers (0–9)
- **Default:** Blocked (ON)
- **Normal Function:** Jump to timeline percentage
- **Example:** Press "5" to jump to 50% of the video
- **Why Block?** Prevents accidental jumps while typing

### 2. Spacebar
- **Default:** Allowed (OFF)
- **Normal Function:** Play/Pause video
- **Why Block?** You might want pause to be intentional only

### 3. Arrow Keys (↑ ↓ ← →)
- **Default:** Allowed (OFF)
- **Normal Functions:**
  - ← / → = Rewind/Forward 5 seconds
  - ↑ / ↓ = Navigate comments
- **Why Block?** Can interfere with page scrolling

### 4. Ctrl + Left Arrow
- **Default:** Blocked (ON)
- **Normal Function:** Jump to previous chapter
- **Why Block?** Accidental chapter skips

### 5. Ctrl + Right Arrow
- **Default:** Blocked (ON)
- **Normal Function:** Jump to next chapter
- **Why Block?** Accidental chapter skips

### 6. F Key
- **Default:** Allowed (OFF)
- **Normal Function:** Toggle fullscreen
- **Why Block?** Only if you want fullscreen button only

### 7. M Key
- **Default:** Blocked (ON)
- **Normal Function:** Mute/Unmute video
- **Why Block:** Prevents accidental muting while typing

### 8. Shift + < / > (Speed Control)
- **Default:** Allowed (OFF)
- **Normal Function:** Slow down (Shift+<) / Speed up (Shift+>)
- **Why Block?** Prevents accidental playback speed changes

### 9. Period (.) / Comma (,)
- **Default:** Allowed (OFF)
- **Normal Functions:**
  - (.) = Next frame
  - (,) = Previous frame
- **Why Block?** Advanced feature, rarely needed

---

## Common Configurations

### Configuration 1: Minimal Blocking (Casual Users)
```
Numbers (0–9):        ON  ✓
Spacebar:             OFF
Arrow Keys:           OFF
Ctrl+Left/Right:      ON  ✓
F Key:                OFF
M Key:                ON  ✓
Speed Control:        OFF
Frame Skip:           OFF
```
**Use Case:** Just prevent number keys and muting

### Configuration 2: Strict Mode (Focus)
```
Numbers (0–9):        ON  ✓
Spacebar:             ON  ✓
Arrow Keys:           ON  ✓
Ctrl+Left/Right:      ON  ✓
F Key:                ON  ✓
M Key:                ON  ✓
Speed Control:        ON  ✓
Frame Skip:           ON  ✓
```
**Use Case:** Block everything, use mouse only

### Configuration 3: Music/Playlist Mode
```
Numbers (0–9):        ON  ✓
Spacebar:             OFF (play/pause is useful)
Arrow Keys:           ON  ✓
Ctrl+Left/Right:      OFF
F Key:                OFF
M Key:                OFF
Speed Control:        OFF
Frame Skip:           ON  ✓
```
**Use Case:** Listening to music, want spacebar for play/pause

### Configuration 4: Accessibility Mode
```
Numbers (0–9):        OFF
Spacebar:             OFF
Arrow Keys:           OFF
Ctrl+Left/Right:      ON  ✓
F Key:                OFF
M Key:                OFF
Speed Control:        OFF
Frame Skip:           OFF
```
**Use Case:** Full keyboard access, only block chapter navigation

---

## Smart Text Detection

The script automatically detects when you're typing and **never blocks keys** in these situations:

✅ **Search bar** - Type without worrying about hotkeys
✅ **Comments section** - Write comments freely
✅ **YouTube Chat** - No interference in live chat
✅ **Any input field** - Text areas are protected
✅ **Content editable areas** - Rich text editors are safe

This means you can safely type numbers, spaces, and other characters without triggering YouTube's hotkeys.

---

## Settings Persistence

Your settings are saved automatically when you click "Save Changes."

### Where Are Settings Stored?
- **Browser Storage:** localStorage (built-in browser storage)
- **Cloud:** Nowhere - completely local and private
- **Sync:** Not synced across browsers

### How to Back Up Settings
Since settings are stored locally, here's how to preserve them:

1. Take a screenshot of your settings before clearing browser data
2. Export your browser profile
3. Keep a text file with your preferred configuration

### How to Reset to Defaults
1. Click each toggle to turn OFF all hotkeys (all white/gray)
2. Click "Save Changes"
3. Now all hotkeys are enabled (default state)

Or manually:
1. Open your browser developer tools (F12)
2. Go to Console tab
3. Type: `localStorage.removeItem('hotkeySettings')`
4. Press Enter
5. Refresh YouTube

---

## Hotkey Testing

Want to verify your settings are working?

### Test Number Keys
1. Open YouTube video
2. In settings, toggle "Disable Numbers" ON
3. While watching, press "5"
4. Video should NOT jump to 50%
5. Try toggling OFF and test again

### Test Spacebar
1. Toggle "Disable Spacebar" ON
2. Press spacebar while video is playing
3. Video should NOT pause
4. Toggle OFF and test again

### Test Arrow Keys
1. Toggle "Disable Arrow Keys" ON
2. Press left/right arrow
3. Video should NOT skip forward/backward
4. Toggle OFF and test again

---

## Troubleshooting Usage Issues

### Settings Won't Save
1. Close the settings modal
2. Click the keyboard icon again
3. Check if your toggles reverted
4. Try using "Save Changes" button again

**Solution:**
- Check if browser allows storage for youtube.com
- Try in a private/incognito window
- Disable any privacy extensions temporarily

### Hotkeys Still Work Despite Being Toggled ON
- Wait a moment for page to fully load
- Refresh the YouTube page (F5)
- Close and reopen the browser
- Reinstall the script

### Keys Not Being Blocked Even Though Toggled OFF
- Make sure you clicked "Save Changes"
- Verify in a new YouTube tab
- Try pressing keys in the video area specifically (not the page)

### Modal Closes Unexpectedly
- Click the keyboard icon again to reopen
- Try clicking "Save Changes" more slowly
- This is a known UI behavior - refresh to continue

---

## Performance Notes

- **Memory Impact:** ~2-3 MB (negligible)
- **CPU Impact:** Minimal (only processes keydown events)
- **Page Load Time:** No impact (script loads after page)
- **Battery Life:** No noticeable drain on laptops/phones

---

## Privacy & Security

✅ **Completely Private**
- No data collection
- No analytics
- No remote connections
- All settings stored locally

✅ **No Permissions Required** (except running on youtube.com)
- Can't access other websites
- Can't steal passwords
- Can't read your history
- Can't modify file system

✅ **Open Source**
- Code is publicly available on GitHub
- Anyone can review what it does
- No hidden operations

---

## Tips & Tricks

💡 **Tip 1: Keyboard-Only Navigation**
- Disable arrow keys to prevent accidental navigation
- Use mouse for all navigation instead
- Great for preventing distractions

💡 **Tip 2: Perfect for Accessibility**
- Use number keys? Block them
- Use custom keyboard shortcuts? Leave them enabled
- Customize for your specific needs

💡 **Tip 3: Different Profiles**
- Take screenshots of different configurations
- Switch between them by toggling manually
- Share configurations with friends

💡 **Tip 4: Testing New Settings**
- Open YouTube in a new tab
- Adjust one setting at a time
- Test the hotkey immediately
- Click Save and move to next setting

---

## Getting Help

📖 **Documentation:** [README.md](../README.md)
📦 **Installation Help:** [INSTALLATION.md](INSTALLATION.md)
🐛 **Report Issues:** [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
💬 **Discussions:** [GitHub Discussions](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)

---

**Last Updated:** January 2026
