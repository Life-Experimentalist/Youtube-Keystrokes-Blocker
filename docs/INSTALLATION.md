# Installation Guide

## Prerequisites

Before installing YouTube Keystrokes Blocker, you need a **Userscript Manager**. This is a browser extension that allows you to run custom scripts on websites.

## Supported Userscript Managers

### 1. **Tampermonkey** (Recommended)
**Best for:** Chrome, Firefox, Edge, Safari
- **Website:** https://www.tampermonkey.net/
- **Why:** Most popular, excellent compatibility, active development

**Installation:**
- Visit [tampermonkey.net](https://www.tampermonkey.net/)
- Click the download link for your browser
- Follow the installation prompts

### 2. **Greasemonkey**
**Best for:** Firefox
- **Website:** https://www.greasespot.net/
- **Why:** Original userscript manager, Firefox-specific

**Installation:**
- Visit [greasespot.net](https://www.greasespot.net/)
- Download for Firefox
- Follow installation instructions

### 3. **Violentmonkey**
**Best for:** Chrome, Firefox, Edge (Open source alternative)
- **Website:** https://violentmonkey.github.io/
- **Why:** Open-source, lightweight, highly compatible

**Installation:**
- Visit [violentmonkey.github.io](https://violentmonkey.github.io/)
- Select your browser
- Install from official store

---

## Installation Methods

### Method 1: One-Click Install (Easiest)

1. **Ensure you have a Userscript Manager installed** (see above)
2. **Click this link:** [Install YouTube Keystrokes Blocker](https://raw.githubusercontent.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/main/disable-yt-hotkeys.user.js)
3. A popup will appear asking to confirm installation
4. Click **"Install"** or **"OK"**
5. Done! The script is now active

### Method 2: Manual Installation

1. **Open your Userscript Manager**
   - Click the extension icon in your toolbar
   - Look for "+ Create a new script" or "New script"

2. **Copy the Script**
   - Visit: https://raw.githubusercontent.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/main/disable-yt-hotkeys.user.js
   - Select all text (Ctrl+A)
   - Copy (Ctrl+C)

3. **Paste into Manager**
   - In your userscript manager, paste the entire content
   - Save the script (Ctrl+S)

4. **Verify Installation**
   - Visit [youtube.com](https://www.youtube.com)
   - Watch any video
   - Look for the keyboard icon (⌨️) in the player controls
   - Click it to verify it's working

### Method 3: GitHub Installation

1. **Visit the GitHub Repository**
   - Go to: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker

2. **Open the Script File**
   - Click on `disable-yt-hotkeys.user.js`

3. **Click "Raw"**
   - A raw text view will open
   - Your userscript manager should detect it

4. **Install**
   - Click install when prompted

---

## Verification

### How to Know It's Installed

✅ **You see a keyboard icon (⌨️) in YouTube's player controls**

This appears in the bottom-right corner of the video player, next to other controls.

### If You Don't See the Icon

1. **Refresh the page** (F5)
2. **Check if the script is enabled** in your userscript manager
3. **Visit a YouTube video page** (not just the homepage)
4. **Use the manager menu** as an alternative:
   - Click your userscript manager icon
   - Select "YouTube Hotkey Settings"

---

## Browser-Specific Instructions

### Google Chrome
```
1. Install Tampermonkey from Chrome Web Store
2. Click the install link above
3. Confirm installation
4. Go to youtube.com ✓
```

### Mozilla Firefox
```
1. Install Tampermonkey or Greasemonkey from Firefox Add-ons
2. Click the install link above
3. Confirm installation
4. Go to youtube.com ✓
```

### Microsoft Edge
```
1. Install Tampermonkey from Microsoft Edge Add-ons
2. Click the install link above
3. Confirm installation
4. Go to youtube.com ✓
```

### Safari (macOS)
```
1. Install Tampermonkey from App Store
2. Visit raw script URL
3. Tampermonkey will prompt to install
4. Go to youtube.com ✓
```

---

## Troubleshooting

### Issue: "Userscript manager not found"
**Solution:** You need to install a userscript manager first. See "Supported Userscript Managers" above.

### Issue: Script isn't working on YouTube
**Solution:**
- Verify the manager is enabled
- Check the manager dashboard to ensure the script is enabled
- Refresh the YouTube page (F5)
- Try opening a video directly (not a playlist)

### Issue: Settings are not saving
**Solution:**
- Check if your browser allows the script to access localStorage
- Try disabling any "Enhanced Privacy" features for youtube.com
- Clear browser cache and cookies for youtube.com
- Reinstall the script

### Issue: Keyboard icon is not visible
**Solution:**
- Wait for the video player to fully load
- The icon appears in the player controls (bottom-right)
- Try using the userscript manager menu instead (Look for "YouTube Hotkey Settings")
- Refresh the page

### Issue: Script conflicts with other extensions
**Solution:**
- Check if you have other YouTube-modifying extensions
- Try disabling them temporarily to test
- Open an issue on GitHub if the problem persists

---

## Updating the Script

Userscript managers automatically check for updates. Here's how to manually update:

### Tampermonkey
1. Click Tampermonkey icon
2. Click "Check for userscript updates"
3. If an update is available, click install

### Greasemonkey
1. Open Greasemonkey dashboard
2. Right-click the script
3. Click "Check for updates"

### Violentmonkey
1. Click Violentmonkey icon
2. Open dashboard
3. Click the update icon for this script

---

## Uninstalling

### Tampermonkey
1. Click the Tampermonkey icon
2. Find "YouTube Keystrokes Blocker"
3. Click the trash icon

### Greasemonkey
1. Open Greasemonkey dashboard
2. Right-click the script
3. Click "Remove"

### Violentmonkey
1. Click Violentmonkey icon
2. Open dashboard
3. Click delete icon next to the script

---

## Need Help?

📧 **Having issues?** Visit the [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues) page and describe your problem. We're here to help!

---

**Last Updated:** January 2026
