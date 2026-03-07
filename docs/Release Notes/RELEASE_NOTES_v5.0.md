# Release Notes — v5.0.0

**Released:** March 7, 2026
**Type:** Major — Browser Extension Launch + Critical Bug Fix

---

## Highlights

YouTube Keystrokes Blocker is now available as a **native browser extension** for Chrome, Edge, and Firefox — no Tampermonkey or userscript manager required. The extension is built on Manifest V3, uses `chrome.storage.sync` for cross-device settings, and ships with both a compact toolbar popup and a full options page.

This release also ships a **critical bug fix** for Tampermonkey users: the hotkey button and blocking were not working when navigating to a new video via in-page links.

---

## What's New

### Native Browser Extension (Chrome / Edge / Firefox)

- Install directly from your browser's extension store (or load unpacked for development)
- No Tampermonkey, Greasemonkey, or Violentmonkey required
- Manifest V3 for Chrome/Edge and Firefox 109+
- Extension ID: `youtube-keystrokes-blocker@life-experimentalist` (Firefox)

### Toolbar Popup

Click the 🎹 extension icon in your toolbar to instantly access a compact settings panel:

- All basic controls togglable with a single click
- "Show more controls" to expand advanced options
- Direct link to the full settings page
- Shows current extension version

### Full Options Page

Open via the popup gear icon or from your browser's extension settings:

- Settings grouped into 5 clear categories: Basic Controls, Playback & Navigation, Captions & Accessibility, View Modes & UI, Spherical / 360° Video
- Each setting has a short description of what the hotkey does
- Save / Reset to Defaults buttons
- Status confirmation on save

### Cross-device Settings Sync

Settings are stored in `chrome.storage.sync` and automatically sync across all signed-in browser instances on Chrome/Edge. Firefox Sync is supported when using Firefox Accounts.

### Live Settings Propagation

Changes made in the popup or options page are reflected immediately in any open YouTube tab — no page reload required. This is handled via `chrome.storage.onChanged`.

### Build System

A full PowerShell build pipeline is now included:

| Command                 | Description                                      |
| ----------------------- | ------------------------------------------------ |
| `npm run build:chrome`  | Build Chrome/Edge `.zip` → `release/`            |
| `npm run build:firefox` | Build Firefox `.zip` → `release/`                |
| `npm run build:all`     | Build both extensions + copy userscript artifact |
| `npm run release`       | Full release: build → validate → git tag → push  |

Versioned output files:

```
release/
  youtube-hotkeys-blocker-v5.0.0-chrome.zip
  youtube-hotkeys-blocker-v5.0.0-firefox.zip
  youtube-hotkeys-blocker-v5.0.0-userscript.user.js
```

---

## Bug Fix: SPA Navigation (Critical)

**Affected:** Tampermonkey userscript + all previous versions

**Symptom:** After clicking a video link on YouTube, the Hotkeys button did not appear in the video actions bar, and hotkey blocking stopped working. Only a full page reload (F5) would make it work again.

**Root Cause:** The `tryInjectWithRetry()` function had an early-exit guard:

```js
if (document.getElementById("yt-hk-action-btn")) { return; }
```

During YouTube's SPA navigation, the **old button element was still in the DOM** when the retry loop began. The guard detected the stale element and bailed out, so the new page never received the button injection.

**Fix:**

1. Added a `yt-navigate-start` listener that immediately removes `#yt-hk-action-btn` when navigation begins — before the retry loop even runs.
2. `handlePageChange()` also explicitly removes any stale button before scheduling `tryInjectWithRetry`.
3. `yt-page-data-updated` handler now checks `isInjecting` to prevent unnecessary state resets.
4. The `MutationObserver` callback is now debounced (80 ms) to prevent flooding `tryInjectWithRetry()` on rapid DOM mutations during page load.

---

## Installation

### Tampermonkey / Greasemonkey (updated userscript)

[Install from Greasy Fork](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page) or install directly from the raw GitHub URL.

### Chrome / Edge (extension)

1. Download `youtube-hotkeys-blocker-v5.0.0-chrome.zip` from [GitHub Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/tag/v5.0.0)
2. Unzip the file
3. Go to `chrome://extensions` → enable Developer Mode → Load unpacked → select the unzipped folder

> Chrome Web Store submission is in progress.

### Firefox (extension)

1. Download `youtube-hotkeys-blocker-v5.0.0-firefox.zip` from [GitHub Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/tag/v5.0.0)
2. Go to `about:debugging#/runtime/this-firefox` → Load Temporary Add-on → select the zip file

> Firefox Add-ons (AMO) submission is in progress.

---

## Upgrading from v4.x

No settings migration is needed. If upgrading the Tampermonkey userscript, your existing settings are preserved (stored in GM_getValue/GM_setValue, unchanged).

If switching from the userscript to the browser extension, you will need to re-configure your settings once in the extension's options page since the storage backends are separate.

---

## Full Changelog

See [CHANGELOG.md](../../CHANGELOG.md) for the complete history.
