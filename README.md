# YouTube Keystrokes Blocker

<img src="src/icons/icon.svg" alt="YouTube Keystrokes Blocker Logo" width="128" height="128" align="right">


Block distracting YouTube keyboard shortcuts while keeping the ones you need — available as a **native browser extension** and a **userscript**.

[![Version](https://img.shields.io/badge/version-5.0.0-brightgreen?style=flat-square)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/latest)
[![GitHub Stars](https://img.shields.io/github/stars/Life-Experimentalist/Youtube-Keystrokes-Blocker?style=flat-square&logo=github)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/Life-Experimentalist/Youtube-Keystrokes-Blocker?style=flat-square)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/Life-Experimentalist/Youtube-Keystrokes-Blocker?style=flat-square)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/commits/main)
[![Greasy Fork](https://img.shields.io/badge/Greasy%20Fork-563265-FF0000?style=flat-square&logo=tampermonkey&logoColor=white)](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue?style=flat-square)](LICENSE.md)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES2020+-yellow?style=flat-square)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Chrome MV3](https://img.shields.io/badge/Chrome-Manifest%20V3-4285F4?style=flat-square&logo=googlechrome&logoColor=white)](https://developer.chrome.com/docs/extensions/mv3/intro/)
[![Edge Add-on](https://img.shields.io/badge/Edge-Add--on-0078D7?style=flat-square&logo=microsoftedge&logoColor=white)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/latest)
[![Firefox MV3](https://img.shields.io/badge/Firefox-Manifest%20V3-FF7139?style=flat-square&logo=firefox&logoColor=white)](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions)

## 📌 Features

✨ **Fine-Grained Control**
- Individually toggle each YouTube hotkey — enable only what you need, block everything else
- Modern settings modal integrated directly into YouTube's player interface
- 30+ independent hotkey toggles

🎯 **Complete Hotkey Coverage**
- **Number Keys (0–9)** — Jump to timeline percentage
- **Spacebar** — Play/Pause toggle
- **Arrow Keys** — Timeline navigation (Left/Right ±5s) and volume (Up/Down)
- **Ctrl + Left / Right** — Chapter navigation
- **F Key** — Fullscreen toggle
- **M Key** — Mute/Unmute
- **K Key** — Play/Pause (alternative)
- **J / L Keys** — Seek ±10 seconds
- **T Key** — Theatre mode toggle
- **C Key** — Captions toggle
- **I Key** — Mini player toggle
- **Shift + < / >** — Playback speed control
- **Period / Comma** — Frame-by-frame navigation
- **Home / End** — Jump to beginning/end

🔐 **Smart Context Detection**
- Automatically ignores key presses when typing in search, comments, or chat
- Preserves all non-blocked YouTube functionality unchanged

⚙️ **Persistent Settings**
- Settings saved locally — no accounts, no cloud, no privacy concerns
- Survives page navigations and SPA transitions

🧩 **Two Ways to Install**
- Native browser extension for Chrome, Firefox, and Edge (Manifest V3)
- Userscript for Tampermonkey, Greasemonkey, and Violentmonkey

---

## 🚀 Installation

### Option A: Browser Extension (Native)

> No userscript manager required. Installs directly into Chrome, Firefox, or Edge.

#### Chrome & Edge

1. Download `youtube-hotkeys-blocker-v5.0.0-chrome.zip` from [GitHub Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/latest)
2. Unzip the file to a folder
3. Chrome: navigate to `chrome://extensions/` | Edge: navigate to `edge://extensions/`
4. Enable **Developer Mode** (toggle in the top-right)
5. Click **Load unpacked** and select the unzipped folder
6. The extension icon appears in your toolbar

> Chrome Web Store and Edge Add-ons submissions are in progress — check [Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases) for store links when available.

#### Firefox

1. Download `youtube-hotkeys-blocker-v5.0.0-firefox.zip` from [GitHub Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/latest)
2. In Firefox navigate to `about:debugging#/runtime/this-firefox`
3. Click **Load Temporary Add-on…** and select the `.zip` directly
4. The extension activates immediately on YouTube

> Firefox AMO submission is in progress — check [Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases) for the store link when available.

---

### Option B: Userscript

> Requires a userscript manager. Works on any browser that supports one.

#### Step 1 — Install a Userscript Manager

| Manager                                           | Chrome | Firefox | Edge | Safari |
| ------------------------------------------------- | ------ | ------- | ---- | ------ |
| [Tampermonkey](https://www.tampermonkey.net/) ⭐   | ✅      | ✅       | ✅    | ✅      |
| [Greasemonkey](https://www.greasespot.net/)       | ❌      | ✅       | ❌    | ❌      |
| [Violentmonkey](https://violentmonkey.github.io/) | ✅      | ✅       | ✅    | ❌      |

#### Step 2 — Install the Script

**From Greasy Fork (Recommended — auto-updates daily):**

[![Install from Greasy Fork](https://img.shields.io/badge/Install%20from-Greasy%20Fork-FF0000?style=flat-square&logo=tampermonkey&logoColor=white)](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page)

**Direct GitHub install:**

👉 **[Click to install from GitHub](https://raw.githubusercontent.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/main/disable-yt-hotkeys.user.js)**

**Manual:**
1. Open your userscript manager dashboard
2. Create a new script
3. Paste the contents of [`disable-yt-hotkeys.user.js`](disable-yt-hotkeys.user.js)
4. Save and enable

---

## 💡 Usage

### Opening Settings

**Browser Extension:**
- Click the toolbar icon to open the popup
- Or press **Alt+Shift+H** (Windows/Linux) / **Cmd+Shift+H** (Mac) from any YouTube page

**Userscript:**
- Look for the **⌨️ keyboard icon** in the YouTube video player controls
- Or open your userscript manager menu → "YouTube Hotkey Settings"

### Default Configuration

| Hotkey           | Blocked by Default |
| ---------------- | ------------------ |
| Numbers (0–9)    | ✅ Yes              |
| Ctrl + Left      | ✅ Yes              |
| Ctrl + Right     | ✅ Yes              |
| M (Mute)         | ✅ Yes              |
| Spacebar         | ❌ No               |
| Arrow Keys       | ❌ No               |
| F (Fullscreen)   | ❌ No               |
| Speed (Shift+<>) | ❌ No               |
| Frame Skip (./,) | ❌ No               |

---

## 🛠️ Configuration

All settings are stored locally via `chrome.storage.sync` (extension) or `GM_setValue` (userscript). No external servers involved.

### Full Settings Reference

| Setting                  | Key                | Default | Description                       |
| ------------------------ | ------------------ | ------- | --------------------------------- |
| Disable Numbers (0–9)    | `disableNumbers`   | ✅ ON    | Blocks timeline jump shortcuts    |
| Disable Spacebar         | `disableSpacebar`  | OFF     | Blocks play/pause                 |
| Disable Arrow Keys       | `disableArrowKeys` | OFF     | Blocks timeline/volume navigation |
| Disable Ctrl+Left        | `disableCtrlLeft`  | ✅ ON    | Blocks previous chapter           |
| Disable Ctrl+Right       | `disableCtrlRight` | ✅ ON    | Blocks next chapter               |
| Disable F (Fullscreen)   | `disableF`         | OFF     | Blocks fullscreen toggle          |
| Disable M (Mute)         | `disableM`         | ✅ ON    | Blocks mute toggle                |
| Disable K (Play/Pause)   | `disableK`         | OFF     | Blocks K key play/pause           |
| Disable J (Seek −10s)    | `disableJ`         | OFF     | Blocks 10-second rewind           |
| Disable L (Seek +10s)    | `disableL`         | OFF     | Blocks 10-second skip             |
| Disable T (Theatre)      | `disableT`         | OFF     | Blocks theatre mode               |
| Disable C (Captions)     | `disableC`         | OFF     | Blocks caption toggle             |
| Disable I (Mini Player)  | `disableI`         | OFF     | Blocks mini player                |
| Disable Speed (Shift+<>) | `disableSpeed`     | OFF     | Blocks speed controls             |
| Disable Frame Skip (./,) | `disableFrameSkip` | OFF     | Blocks frame-by-frame navigation  |
| Disable Home/End         | `disableHomeEnd`   | OFF     | Blocks jump to start/end          |

---

## ⌨️ Extension Keyboard Commands

When installed as a browser extension, the following shortcut is available:

| Command             | Windows / Linux | Mac             |
| ------------------- | --------------- | --------------- |
| Open Settings Popup | **Alt+Shift+H** | **Cmd+Shift+H** |

To customize this shortcut:
- **Chrome/Edge**: `chrome://extensions/shortcuts`
- **Firefox**: `about:addons` → gear icon → Manage Extension Shortcuts

---

## 🔍 How It Works

1. **Intercepts keyboard events** on `www.youtube.com` at `document_start`
2. **Checks each key** against your saved settings
3. **Calls `preventDefault()` and `stopImmediatePropagation()`** for blocked keys, preventing YouTube from processing them
4. **Skips blocking** when focus is in a search box, comment field, or any other text input
5. **Watches for SPA navigation** (`yt-navigate-finish`) to re-attach handlers after YouTube's client-side page transitions
6. **Persists settings** using `chrome.storage.sync` (extension) or `GM_setValue` (userscript) — no external servers

---

## 🐛 Troubleshooting

### Extension not working?
- Verify the extension is enabled at `chrome://extensions/` or `about:addons`
- Reload the YouTube tab after enabling
- Check that the `*://www.youtube.com/*` host permission is granted

### Userscript not working?
- Ensure your userscript manager is enabled for YouTube
- Reload the YouTube page
- Check that no other extensions are intercepting keyboard events before this one

### Settings not saving?
- **Extension**: confirm the `storage` permission is granted
- **Userscript**: confirm your manager allows `GM_setValue` on `youtube.com`
- Disable any aggressive privacy extensions temporarily to test

### Keyboard icon not showing (userscript only)?
- Refresh the YouTube page
- Navigate to a video — the button injects into the player controls after the player loads
- Use the userscript manager menu as a fallback access method

### Need help?
[Open an issue on GitHub](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)

---

## 🔧 Development

### Project Structure

```
Youtube Keystrokes Blocker/
├── disable-yt-hotkeys.user.js     # Userscript (single-file, self-contained)
├── src/
│   ├── content.js                 # Extension content script
│   ├── background.js              # Extension service worker
│   ├── content.css                # Content script styles
│   ├── popup/                     # Toolbar popup UI
│   ├── options/                   # Full options page UI
│   ├── manifests/
│   │   ├── manifest.chrome.json   # Chrome/Edge MV3 manifest
│   │   └── manifest.firefox.json  # Firefox MV3 manifest
│   └── icons/                     # SVG source icon
├── scripts/
│   ├── Build-Extension.ps1        # Builds Chrome + Firefox ZIPs
│   ├── Build-All.ps1              # Builds extension + copies userscript
│   └── Update-Version.ps1         # Bumps version across all files
├── release/                       # Built artifacts (git-ignored)
└── docs/                          # Documentation
```

### Build Commands

```powershell
# Build all artifacts (extension ZIPs + userscript copy)
npm run build:all

# Build extension packages only
npm run build:extension

# Version management
npm run version:patch    # 5.0.0 → 5.0.1
npm run version:minor    # 5.0.0 → 5.1.0
npm run version:major    # 5.0.0 → 6.0.0

# Full release (version bump + build)
npm run release
```

---

## 📝 License

Licensed under the **Apache License 2.0** — see [LICENSE.md](LICENSE.md) for details.

## 🤝 Contributing

1. [Fork the repository](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/fork)
2. Make your changes
3. [Open a pull request](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/pulls)

Bug reports and feature requests are welcome on [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues).

---

## 👨‍💻 Author

Created and maintained by [VKrishna04](https://github.com/VKrishna04)

Part of the [Life Experimentalist](https://github.com/Life-Experimentalist) organization

## 🌐 Links

|               |                                                                                                                       |
| ------------- | --------------------------------------------------------------------------------------------------------------------- |
| 🏠 Homepage    | [yt-hotkeys.vkrishna04.me](https://yt-hotkeys.vkrishna04.me/)                                                         |
| 📦 GitHub      | [Life-Experimentalist/Youtube-Keystrokes-Blocker](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker) |
| 🐛 Issues      | [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)                            |
| 📋 Releases    | [GitHub Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases)                        |
| 📦 Greasy Fork | [Script page](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page)             |
| 📊 Changelog   | [CHANGELOG.md](CHANGELOG.md)                                                                                          |

---

**Last Updated:** 2026 | **Version 5.0.0** | **Active Development** ✅

⭐ If you find this useful, please [star the repository](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker)!