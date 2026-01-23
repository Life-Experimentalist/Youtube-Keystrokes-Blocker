# YouTube Keystrokes Blocker

A powerful userscript that gives you fine-grained control over YouTube keyboard shortcuts. Block distracting hotkeys while keeping the ones you need active.

[![Greasy Fork](https://img.shields.io/badge/Greasy%20Fork-563265-FF0000?style=flat-square&logo=tampermonkey&logoColor=white)](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page) ![Version](https://img.shields.io/badge/version-4.3-brightgreen?style=flat-square) ![License](https://img.shields.io/badge/license-Apache%202.0-blue?style=flat-square) ![Platform](https://img.shields.io/badge/platform-Browser%20Userscript-orange?style=flat-square) ![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-yellow?style=flat-square) ![Size](https://img.shields.io/badge/size-~13.5KB-blue?style=flat-square)

## 📌 Features

✨ **Fine-Grained Control**
- Selectively disable YouTube hotkeys without affecting other functionality
- Modern, intuitive settings modal built into YouTube's player
- Individual toggles for each hotkey group

🎯 **Supported Hotkeys**
- **Number Keys (0–9)** - Jump to timeline percentage
- **Spacebar** - Play/Pause
- **Arrow Keys** - Navigation (Up/Down for Comments, Left/Right for Timeline)
- **Ctrl + Left/Right** - Chapter navigation
- **F Key** - Fullscreen toggle
- **M Key** - Mute/Unmute
- **Shift + < / >** - Playback speed control
- **. (Period) / , (Comma)** - Frame-by-frame navigation

🔐 **Smart Protection**
- Won't interfere with text input (search, comments, chat)
- Automatically detects when you're typing
- Preserves YouTube's core functionality

⚙️ **Easy Configuration**
- No complicated settings files or configs
- Access settings with a single click on the player
- Settings persist across sessions

## 🚀 Installation

### Option 1: Greasy Fork (Recommended)
[![Install from Greasy Fork](https://img.shields.io/badge/Install%20from-Greasy%20Fork-FF0000?style=flat-square&logo=tampermonkey&logoColor=white)](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page)

1. Click the button above or visit the [Greasy Fork page](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page)
2. Click "Install this script"
3. Your userscript manager will handle the rest
4. Automatic daily updates will keep you current

### Option 2: Direct GitHub Install
Click this link to install directly:
👉 **[Install YouTube Keystrokes Blocker](https://raw.githubusercontent.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/main/disable-yt-hotkeys.user.js)**

### Option 3: Manual Installation

1. **Install a Userscript Manager**
   - [Tampermonkey](https://www.tampermonkey.net/) (Recommended - Chrome, Firefox, Edge, Safari)
   - [Greasemonkey](https://www.greasespot.net/) (Firefox)
   - [Violentmonkey](https://violentmonkey.github.io/) (Chrome, Firefox, Edge)

2. **Copy the Script**
   - Visit the [raw script URL](https://raw.githubusercontent.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/main/disable-yt-hotkeys.user.js)
   - Copy the entire content

3. **Create a New Script**
   - Open your userscript manager
   - Create a new script
   - Paste the content
   - Save and enable

4. **Verify Installation**
   - Visit [youtube.com](https://www.youtube.com)
   - Look for the **keyboard icon** (⌨️) in the video player controls
   - Click to configure your hotkeys

### ⏰ Update Frequency
- **Greasy Fork install**: Automatic daily checks for updates
- **GitHub install**: Manual updates recommended every 1-2 weeks
- Updates include bug fixes, feature improvements, and YouTube compatibility fixes

## 💡 Usage

### Accessing Settings

**Option 1: Player Button** (Recommended)
- Look for the keyboard icon in YouTube's video player controls
- Click to open the settings modal
- Toggle switches to enable/disable hotkeys
- Click "Save Changes"

**Option 2: Userscript Manager Menu**
- Click your userscript manager icon
- Select "YouTube Hotkey Settings"

### Default Configuration

By default, the following hotkeys are **disabled**:
- ✓ Number Keys (0–9)
- ✓ Ctrl + Left
- ✓ Ctrl + Right
- ✓ M Key (Mute)

The following are **enabled** (not blocked):
- ✗ Spacebar
- ✗ Arrow Keys
- ✗ F Key (Fullscreen)
- ✗ Shift + < / > (Speed)
- ✗ . / , (Frame Skip)

You can customize these settings to your preference.

## 🛠️ Configuration

All settings are saved locally in your browser. No cloud storage, no privacy concerns.

### Settings Options

| Setting                  | Default | Effect                             |
| ------------------------ | ------- | ---------------------------------- |
| Disable Numbers (0–9)    | ✓ ON    | Blocks timeline jump shortcuts     |
| Disable Spacebar         | OFF     | Blocks play/pause                  |
| Disable Arrow Keys       | OFF     | Blocks comment/timeline navigation |
| Disable Ctrl + Left      | ✓ ON    | Blocks previous chapter            |
| Disable Ctrl + Right     | ✓ ON    | Blocks next chapter                |
| Disable F (Fullscreen)   | OFF     | Blocks fullscreen toggle           |
| Disable M (Mute)         | ✓ ON    | Blocks mute toggle                 |
| Disable Speed (Shift+<>) | OFF     | Blocks speed control               |
| Disable Frame Skip (./,) | OFF     | Blocks frame-by-frame              |

## 🔍 How It Works

1. **Listens for keydown events** on the YouTube page
2. **Checks against blocked hotkeys** based on your settings
3. **Prevents default behavior** for disabled keys
4. **Ignores keys while typing** in search, comments, or chat
5. **Persists settings** using browser storage (no external servers)

## 🐛 Troubleshooting

### Script not working?
- Ensure your userscript manager is enabled
- Try visiting a YouTube video page
- Refresh the page (F5 or Ctrl+R)

### Settings not saving?
- Check that your browser allows the userscript manager to access YouTube
- Clear your browser cache and try again
- Disable any conflicting extensions

### Keyboard icon not showing?
- Refresh the YouTube page
- Some video player skins might hide it
- Use the userscript manager menu as an alternative

### Need help?
📧 Create an issue on [GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)

## 📝 License

This project is licensed under the **Apache License 2.0** - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Found a bug? Have a feature request? Feel free to:
1. [Open an issue](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
2. Submit a pull request
3. Discuss improvements in the issues section

## 👨‍💻 Author

Created and maintained by [VKrishna04](https://github.com/VKrishna04)

Part of the [Life Experimentalist](https://github.com/Life-Experimentalist) organization

## 🌐 Links

- 🏠 [Homepage](https://vkrishna04.me)
- 📦 [GitHub Repository](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker)
- 🐛 [Issues & Support](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
- 📋 [Latest Release](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases)

## 📊 [Version History](CHANGELOG.md)

> Check out the [CHANGELOG](CHANGELOG.md) for a detailed version history and update notes.

## ⭐ If you find this useful, please star the repository!

Your support helps us continue improving this script and creating more useful tools.

---

**Last Updated:** January 19, 2026 | **Version 4.3** | **Active Development** ✅

**Status**: Production Ready | Downloads via Greasy Fork | Daily Auto-Updates Enabled

---

## 🎯 Quick Links

| Link                                                                                                        | Purpose                                   |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| [📦 Greasy Fork](https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page) | Official distribution & automatic updates |
| [🐛 GitHub Issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)                | Report bugs & request features            |
| [📝 GitHub Repo](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker)                         | View source code & contribute             |
| [🏠 Author Homepage](https://vkrishna04.me)                                                                  | Learn more about the author               |
