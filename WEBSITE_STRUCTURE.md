# Website Structure Guide

## 📄 Page Hierarchy

### Homepage (index.html)
The main landing page with complete information about the project.

```
┌─────────────────────────────────────────────────────────┐
│                    NAVIGATION BAR                        │
│  ⌨️ YT Keystrokes  │ Features │ Hotkeys │ Install │ FAQ │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│           HERO SECTION (Landing)                         │
│  "Take Control of YouTube Hotkeys"                      │
│  [📥 Install Now]  [⭐ View on GitHub]                 │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│         FEATURES SECTION (6 Feature Cards)              │
│  ⚙️ Fine Control │ 🎯 Smart Detection │ 💾 Persistent │
│  🎨 Beautiful UI │ ⚡ Zero Impact │ 🔄 Auto-Update      │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│      HOTKEYS SECTION (9 Hotkey Cards)                   │
│  [0-9] [SPACE] [↑↓←→] [CTRL+←] [CTRL+→] [F] [M] [+]   │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│     SETTINGS DEMO (Interactive Modal Preview)           │
│  ⌨️ Hotkey Settings                                     │
│  ☑️ Disable Numbers        [━━●━]                       │
│  ☐ Disable Spacebar        [━━━━]                       │
│  ... (7 more options)                                    │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│    INSTALLATION SECTION (4 Step Cards)                  │
│  ① Install Manager │ ② Click Install │ ③ Go to YT │ ④  │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│    BROWSER SUPPORT (4 Browser Icons)                    │
│  🌐 Chrome │ 🦊 Firefox │ ⚡ Edge │ 🧭 Safari           │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│      FAQ SECTION (8 Accordion Items)                    │
│  ► What's a userscript?                                │
│  ► Is this safe?                                        │
│  ► How do I install?                                    │
│  ... (5 more items)                                      │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                    FOOTER                                │
│  [GitHub] [Issues] [Author] [Website]                  │
│  © 2024-2026 by VKrishna04                             │
└─────────────────────────────────────────────────────────┘
```

---

## 📚 Documentation Pages

### README.md
```
├─ Features (6 main features)
├─ Installation (Option 1 & 2)
├─ Usage (2 access methods)
├─ Configuration (Default settings)
├─ How It Works
├─ Troubleshooting (4 sections)
├─ License & Contributing
└─ Links & Version History
```

### docs/INSTALLATION.md
```
├─ Prerequisites
├─ Supported Managers (3 options)
├─ Installation Methods (3 ways)
├─ Verification Steps
├─ Browser-Specific Instructions (4 browsers)
├─ Troubleshooting (6 issues)
├─ Updating
├─ Uninstalling
└─ Support Links
```

### docs/USAGE.md
```
├─ Quick Start (5 steps)
├─ Accessing Settings (2 methods)
├─ Understanding Modal
├─ Available Hotkeys (9 hotkeys detailed)
├─ Common Configurations (4 profiles)
├─ Smart Text Detection
├─ Settings Persistence
├─ Hotkey Testing Guide
├─ Troubleshooting (5 sections)
├─ Performance Notes
├─ Privacy & Security
├─ Tips & Tricks
└─ Getting Help
```

### docs/DEVELOPMENT.md
```
├─ Project Structure
├─ How It Works (4 steps)
├─ Key Functions (4 functions)
├─ Technical Details (3 systems)
├─ Making Changes (Adding hotkey guide)
├─ Browser APIs (3 categories)
├─ Performance (3 aspects)
├─ Browser Compatibility Matrix
├─ Common Issues & Solutions
├─ Contributing Guidelines
├─ Testing Checklist
├─ Version Management
├─ Future Improvements
└─ Resources
```

### docs/FAQ.md
```
├─ General Questions (5 Q&A)
├─ Installation Questions (6 Q&A)
├─ Usage Questions (6 Q&A)
├─ Troubleshooting Questions (7 Q&A)
├─ Hotkey Questions (6 Q&A)
├─ Privacy & Security Questions (4 Q&A)
├─ Technical Questions (7 Q&A)
├─ Support Questions (5 Q&A)
├─ Version Questions (3 Q&A)
├─ Account & Licensing Questions (4 Q&A)
└─ Still Have Questions? (5 resources)
```

### CONTRIBUTING.md
```
├─ Ways to Contribute (5 ways)
├─ Getting Started
├─ Development Process
├─ Code Style Guidelines
├─ Testing Your Changes
├─ Pull Request Process
├─ Reporting Bugs
├─ Feature Requests
├─ Documentation Contributions
├─ Code Review Guidelines
├─ Community Guidelines
├─ Recognition
└─ Additional Resources
```

### CHANGELOG.md
```
├─ [2.0] - 2026-01-19 (Latest)
│   ├─ Added (8 features)
│   ├─ Improved (7 items)
│   ├─ Changed (5 items)
│   └─ Fixed (4 issues)
├─ [1.0] - 2025-12-15 (Archive)
├─ [Unreleased] (Planned features)
├─ Version Numbering Rules
├─ Release History Table
├─ Breaking Changes
├─ Deprecation Notices
└─ Git Tags & Downloads
```

---

## 🔗 Navigation Links

### From Homepage (index.html)
```
⌨️ Logo → #features
Features → #features
Hotkeys → #hotkeys
Install → #install
FAQ → #faq
GitHub → https://github.com/...

Within Page Links:
- Smooth scroll to sections
- All internal links work
- All external links open in new tab
```

### From README.md
```
→ Installation Guide (docs/INSTALLATION.md)
→ Usage Guide (docs/USAGE.md)
→ GitHub Repository
→ Issues Page
→ Author Profile
→ Organization Profile
→ Personal Website
```

### From Documentation Files
```
docs/INSTALLATION.md →
  - Supported Managers (external links)
  - Browser-specific guides
  - Troubleshooting (internal)
  - Getting Help (GitHub links)

docs/USAGE.md →
  - Installation Guide
  - Settings Guide (internal)
  - Getting Help Links

docs/DEVELOPMENT.md →
  - Related Resources (external MDN links)
  - YouTube API (external)
  - Contributing Guide

docs/FAQ.md →
  - All other docs
  - GitHub Issues/Discussions
  - Installation Guide
  - Usage Guide
```

---

## 🎨 Color Scheme

### Primary Colors
```
Primary Red:        #ff0000 (YouTube brand)
Dark Red:          #cc0000 (hover state)
Light Red:         #ff3333 (accent)
Accent Blue:       #3ea6ff (secondary)

Background:        #030303 (deep black)
Card Background:   #1a1a1a (dark gray)
Secondary BG:      #272727 (medium gray)

Text Light:        #f5f5f5 (main text)
Text Dark:         #181818 (dark mode text)
Text Muted:        #b0b0b0 (secondary text)
Text Minimal:      #808080 (tertiary text)
```

### Semantic Colors
```
Success:           #34a853 (green)
Warning:           #fbbc04 (yellow)
Error:             #ff0000 (red)
Info:              #3ea6ff (blue)
```

---

## 📐 Layout Breakdown

### Responsive Breakpoints
```
Desktop:   > 1024px  (Full featured)
Tablet:    768-1024px (Adjusted grid)
Mobile:    < 768px   (Single column)
```

### Grid Systems
```
Features Grid:      3 columns (auto-fit)
Hotkeys Grid:       3-4 columns (auto-fit)
FAQ Grid:           1 column (stacked)
Browsers Grid:      4 items centered
Steps Grid:         4 items (responsive)
```

### Card Sizes
```
Feature Card:       300x300px minimum
Hotkey Card:        250x250px minimum
FAQ Item:           Full width
Browser Card:       Centered, 80px icons
Step Card:          Auto height
```

---

## 🔒 File Permissions

```
public files:
├── index.html              (Read-only)
├── README.md               (Read-only)
├── docs/*.md               (Read-only)
├── LICENSE                 (Read-only)
├── CHANGELOG.md            (Read-only)
├── CONTRIBUTING.md         (Read-only)
├── PROJECT_SUMMARY.md      (Read-only)

config files:
├── package.json            (Read-only)
├── MANIFEST.json           (Read-only)
├── _config.yml             (Read-only)
├── .gitignore              (Read-only)

source:
├── disable-yt-hotkeys.user.js (Read-only - UNTOUCHED)
```

---

## 🚀 Deployment

### GitHub Pages Setup
```
Repository Settings
→ Pages
→ Source: Deploy from a branch
→ Branch: main
→ Folder: / (root)
→ Save

Site will be available at:
https://Life-Experimentalist.github.io/Youtube-Keystrokes-Blocker/
```

### Files Served
```
/ → index.html (homepage)
/README.md → Raw markdown view
/docs/* → Raw markdown views
/docs/INSTALLATION.md → Installation guide
```

### DNS Configuration
```
CNAME (if using custom domain):
Life-Experimentalist.github.io
```

---

## 📊 SEO Elements

### Meta Tags
```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="YouTube Keystrokes Blocker - Control hotkeys">
<meta name="theme-color" content="#ff0000">
<meta property="og:title" content="YouTube Keystrokes Blocker">
<meta property="og:description" content="...">
<meta property="og:image" content="...">
<meta property="og:url" content="...">
```

### Keywords
```
Primary:
- YouTube keyboard shortcuts
- Hotkey blocker
- Userscript

Secondary:
- Tampermonkey
- Greasemonkey
- Browser extension
- YouTube productivity

Long-tail:
- Disable YouTube hotkeys
- Control YouTube keyboard shortcuts
- YouTube userscript
```

---

## ✅ Quality Checklist

### Functionality
- ✅ All links work
- ✅ All buttons functional
- ✅ All accordion items toggle
- ✅ Responsive layout
- ✅ No console errors
- ✅ Cross-browser compatible

### Accessibility
- ✅ Proper heading hierarchy
- ✅ Image alt text
- ✅ Color contrast ratio
- ✅ Keyboard navigation
- ✅ Semantic HTML
- ✅ Screen reader friendly

### Performance
- ✅ Optimized images
- ✅ Minified CSS
- ✅ No render blocking
- ✅ Fast load time
- ✅ Mobile optimized
- ✅ Smooth animations

### SEO
- ✅ Meta tags
- ✅ Open Graph
- ✅ Proper structure
- ✅ Internal linking
- ✅ Mobile responsive
- ✅ Fast loading

---

**This guide provides complete information about the website structure, navigation, and layout.**

**Last Updated:** January 19, 2026
