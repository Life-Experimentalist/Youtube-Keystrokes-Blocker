# Frequently Asked Questions

## General Questions

### Q: What is YouTube Keystrokes Blocker?
**A:** It's a userscript (browser extension) that gives you control over YouTube keyboard shortcuts. You can block specific hotkeys while allowing others to work normally.

### Q: Why would I need this?
**A:**
- Prevent accidental hotkey activation while watching
- Block distracting shortcuts (like the spacebar)
- Reduce interruptions while typing in comments or chat
- Customize your YouTube experience

### Q: Is it safe?
**A:** Yes, absolutely.
- ✓ Open-source code anyone can review
- ✓ No data collection or cloud sync
- ✓ Runs only on youtube.com
- ✓ Transparent operation
- ✓ Licensed under Apache 2.0

### Q: Does it work on mobile?
**A:** Most mobile browsers don't support userscripts natively. However:
- ✓ Firefox for Android supports Tampermonkey
- ✓ Chrome Android has limited support
- Better experience on desktop browsers

### Q: How is it different from other YouTube extensions?
**A:**
- **Fine-grained control** - Individual toggles for each hotkey
- **Lightweight** - No bloated interface or unnecessary features
- **Privacy-focused** - All settings stored locally
- **Open-source** - Code is transparent and auditable
- **Integrated UI** - Settings button in YouTube's player

---

## Installation Questions

### Q: How do I install it?
**A:** See the [Installation Guide](./INSTALLATION.md) for detailed instructions.

**Quick version:**
1. Install Tampermonkey from your browser's extension store
2. Click the install link on our website
3. Confirm installation
4. Done! Look for the keyboard icon on YouTube

### Q: Which browser do I need?
**A:** Any modern browser with Tampermonkey, Greasemonkey, or Violentmonkey:
- ✓ Google Chrome
- ✓ Mozilla Firefox
- ✓ Microsoft Edge
- ✓ Safari (with Tampermonkey)

### Q: Do I need to create an account?
**A:** No. No accounts, no login required. Just install the script.

### Q: What userscript manager should I use?
**A:** We recommend **Tampermonkey** as it's the most popular and reliable:
- Best compatibility across browsers
- Excellent documentation
- Active development
- Regular updates

Alternatives:
- Greasemonkey (Firefox)
- Violentmonkey (open-source option)

### Q: I see "This script will be installed" but nothing happens
**A:** Your userscript manager might need permission:
1. Check the manager's popup/dashboard
2. Look for installation pending
3. Click approve/confirm
4. Grant any requested permissions

### Q: Script isn't showing up after install
**A:**
- Refresh YouTube page (F5)
- Try opening a different video
- Check if the manager is enabled
- Ensure it's running on youtube.com

---

## Usage Questions

### Q: Where is the settings button?
**A:** Look for the **keyboard icon (⌨️)** in the video player controls, bottom-right area, next to other player buttons.

**If you don't see it:**
- Refresh the page (F5)
- Try opening a different YouTube video
- Use your userscript manager menu instead (Settings → YouTube Hotkey Settings)

### Q: How do I know if a hotkey is blocked?
**A:**
- **Green/Blue toggle = BLOCKED** (hotkey won't work)
- **Gray toggle = ALLOWED** (hotkey works normally)

### Q: Why are some hotkeys enabled by default?
**A:** We blocked the most disruptive hotkeys:
- Number keys (easy to accidentally press)
- Ctrl+Left/Right (chapter skips)
- M key (muting)

You can enable/disable any of these to your preference.

### Q: Do my settings save?
**A:** Yes, automatically when you click "Save Changes."
- Saved in browser's local storage
- Persists across browser sessions
- Specific to each YouTube domain
- Not synced across browsers

### Q: Can I export my settings?
**A:** Not currently, but you can:
1. Take a screenshot of your settings
2. Write down which toggles are ON/OFF
3. Manually set them again on another browser
4. Keep a text file with your configuration

---

## Troubleshooting Questions

### Q: Settings don't save
**A:**
1. Ensure you clicked "Save Changes" button
2. Check if browser allows localStorage for youtube.com
3. Try disabling privacy extensions
4. Try in a private browsing window
5. Reinstall the script

### Q: Hotkeys still work even though I toggled them ON
**A:**
1. Make sure you clicked "Save Changes"
2. Refresh the YouTube page (F5)
3. Try a different YouTube video
4. Check if another extension is interfering
5. Try reinstalling the script

### Q: Keyboard icon doesn't appear
**A:**
1. Refresh page (F5)
2. Make sure you're on a video page (not homepage)
3. Wait for video to fully load
4. Check if script is enabled in your manager
5. Use manager menu as alternative (Settings → YouTube Hotkey Settings)

### Q: Script stopped working after update
**A:**
1. Try refreshing YouTube (F5)
2. Restart your browser
3. Reinstall the latest version
4. Check if YouTube changed something major
5. File a GitHub issue if problem persists

### Q: It blocks keys in search bar!
**A:** It shouldn't. The script detects when you're typing and ignores blocked keys.

**If this happens:**
1. Try refreshing
2. Verify you're typing in the actual search box (not somewhere else)
3. Check if another extension is interfering
4. File an issue on GitHub

### Q: Settings modal won't open
**A:**
1. Check browser console (F12) for errors
2. Make sure script is enabled
3. Try clicking the keyboard icon again
4. Refresh the page
5. Restart your browser

### Q: Script conflicts with other extensions
**A:**
1. Disable other YouTube extensions temporarily
2. Test if the conflict goes away
3. Re-enable them one by one to find the culprit
4. File an issue if incompatibility is confirmed

---

## Hotkey Questions

### Q: Why block the number keys?
**A:** Because it's easy to accidentally press a number while typing or gesturing, causing the timeline to jump unexpectedly.

### Q: Can I block custom hotkeys?
**A:** Not yet. The script blocks a predefined set of YouTube hotkeys. Future versions might support custom hotkey blocking.

### Q: What about keyboard shortcuts like Ctrl+T?
**A:** Those are browser shortcuts, not YouTube hotkeys. This script only affects YouTube-specific shortcuts.

### Q: Can I remap hotkeys?
**A:** No, the script can only block existing hotkeys, not remap them. You can suggest this feature on GitHub.

### Q: What if I want to disable ALL hotkeys?
**A:** Toggle all switches to ON and click Save. YouTube will only respond to mouse clicks.

### Q: Can I create different profiles?
**A:** Not built-in, but you can:
1. Take screenshots of different configurations
2. Switch between them manually
3. Use browser profiles with different settings

---

## Privacy & Security Questions

### Q: Does it collect data?
**A:** No. Zero data collection.
- ✓ No analytics
- ✓ No user tracking
- ✓ No cloud sync
- ✓ No third-party services

### Q: Where are my settings stored?
**A:** Locally in your browser's localStorage.
- ✓ Only on your computer
- ✓ Visible to you only
- ✓ Deleted if you clear browser data
- ✓ Not synced anywhere

### Q: Can you access my YouTube account?
**A:** No. The script:
- ✓ Never logs into your account
- ✓ Can't see your history
- ✓ Can't access your subscriptions
- ✓ Can't watch your activity

### Q: Is the code auditable?
**A:** Yes, completely:
- ✓ Source code on GitHub
- ✓ Anyone can review it
- ✓ Transparently written
- ✓ No obfuscation or hidden code

### Q: Should I trust it?
**A:** You can verify it yourself:
1. Open the script on GitHub
2. Read through the code
3. Review what permissions it requests
4. Decide if you trust it
5. The choice is always yours

---

## Technical Questions

### Q: How does the script work?
**A:**
1. Listens for keyboard events on YouTube
2. Checks against your settings
3. Prevents default behavior for blocked keys
4. Skips blocking when you're typing
5. Saves settings locally

See [Development Guide](./DEVELOPMENT.md) for technical details.

### Q: What permissions does it need?
**A:** Minimal permissions:
- **Access youtube.com** - To modify YouTube's behavior
- **localStorage** - To save your settings
- That's it. No mic, camera, or privacy-invasive permissions.

### Q: Does it slow down YouTube?
**A:** No. The script:
- ✓ Minimal memory usage (~2-3 MB)
- ✓ No continuous processing
- ✓ Only processes key events
- ✓ Zero performance impact

### Q: Will it work after YouTube updates?
**A:** Usually yes. The script uses standard web APIs that are unlikely to change. If YouTube makes breaking changes, we'll update the script.

### Q: Can I modify the script for myself?
**A:** Yes, you can:
1. Open the script in your userscript manager
2. Click "Edit"
3. Make changes
4. Save
5. Changes apply to your version only

---

## Support Questions

### Q: How do I report a bug?
**A:**
1. Go to [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
2. Click "New Issue"
3. Describe the problem clearly
4. Include your browser and OS
5. Provide steps to reproduce

### Q: How do I request a feature?
**A:**
1. Check existing issues/discussions first
2. Open a GitHub issue or discussion
3. Clearly describe the feature
4. Explain why you need it
5. We'll discuss and consider it

### Q: Can I contribute?
**A:** Yes! We welcome contributions:
1. Fork the repository
2. Make your changes
3. Test thoroughly
4. Submit a pull request
5. We'll review and merge

See [Development Guide](./DEVELOPMENT.md) for details.

### Q: How often is it updated?
**A:**
- Regular bug fixes
- Features added when requested
- Security updates as needed
- Maintenance to stay compatible with YouTube

### Q: Is there a changelog?
**A:** Check the GitHub releases page for version history and changes.

---

## Version Questions

### Q: What's the current version?
**A:** Version 2.0 (January 2026)

### Q: How do I update?
**A:** Your userscript manager automatically checks for updates. To manually update:
1. Click your manager icon
2. Select "Check for updates"
3. Install if available

### Q: What changed in v2.0?
**A:**
- Modern settings modal with toggle switches
- Individual control for each hotkey
- Improved UI/UX
- Better keyboard icon
- Persistent local storage

---

## Account & Licensing Questions

### Q: Is it free?
**A:** Yes, completely free and open-source.

### Q: What license is it under?
**A:** Apache License 2.0 - Permissive open-source license.
- ✓ Free to use
- ✓ Free to modify
- ✓ Free to distribute
- ✓ Just credit the original author

### Q: Can I use it commercially?
**A:** Yes, the Apache 2.0 license allows commercial use.

### Q: Who owns it?
**A:** VKrishna04 & Life Experimentalist organization.

---

## Still Have Questions?

📧 **Can't find an answer?**
1. Check [README.md](../README.md) for overview
2. Check [Installation Guide](./INSTALLATION.md) for setup help
3. Check [Usage Guide](./USAGE.md) for how to use
4. [Open an issue on GitHub](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
5. [Start a discussion on GitHub](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)

---

**Last Updated:** January 2026
