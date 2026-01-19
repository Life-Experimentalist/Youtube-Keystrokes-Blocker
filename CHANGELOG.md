# Changelog

All notable changes to YouTube Keystrokes Blocker will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [4.1]() - 2026-01-19

### Added
- Official Greasy Fork distribution channel (Script ID: 563265)
- Automatic daily update mechanism via Greasy Fork
- YouTube red color scheme (#ff0033) replacing previous blue
- Email contact field for direct support (hello@vkrishna04.me)
- Enhanced shields/badges in README with version, size, and platform info
- Quick links section in README

### Changed
- Save button color from blue (#3ea6ff) to YouTube red (#ff0033)
- Toggle switch checked color to YouTube red (#ff0033)
- Save button hover color to darker red (#CC0000)
- @downloadURL now points to the actual userscript file
- @supportURL updated to GitHub issues page
- Update frequency clarified in documentation

### Improved
- Better visibility with YouTube red branding
- Clearer update instructions for Greasy Fork users
- Version history documentation with detailed feature lists
- Status indicators showing production readiness

### Security
- Proper metadata for Greasy Fork distribution
- Daily automatic update checks enabled
- Update URLs verified and tested

---

## [4.0]() - 2026-01-19

### Added
- Complete YouTube-native design system integration
- CSS variables for automatic light/dark mode detection
- Enhanced modal animations with cubic-bezier timing (150ms)
- Full-row clickable settings interface
- Proper z-index layering (2201-2202 modal layer)
- Keyboard accessibility with focus states
- Custom scrollbar styling

### Changed
- Modal animation system from opacity to data-visible attributes
- Color variables using YouTube's design system
- Animation timing to professional standards

---

## [2.0]() - 2026-01-19

### Added
- Modern settings modal with toggle switches
- Individual control for each hotkey group
- Beautiful dark-themed UI matching YouTube's interface
- Keyboard icon in player controls
- Support for 9 different hotkey categories
- Smooth animations and transitions
- Comprehensive documentation and guides
- GitHub Pages homepage with interactive demo
- FAQ section with common questions
- Installation guide with browser-specific instructions
- Usage guide with configuration examples
- Development guide for contributors

### Improved
- Better visual design for settings modal
- Cleaner toggle switches instead of checkboxes
- Enhanced user experience with smooth animations
- Better accessibility with proper labels
- Optimized keyboard event handling
- Improved detection of typing contexts
- More efficient DOM updates

### Changed
- Restructured UI with header, content, and footer sections
- New settings persistence system
- Updated default hotkey settings
- Modernized CSS with CSS variables
- New keyboard SVG icon

### Fixed
- Settings modal rendering issues
- Keyboard event propagation
- Toggle switch responsiveness
- Animation timing issues

---

## [1.0]() - 2025-12-15

### Added
- Initial release
- Basic hotkey blocking functionality
- Settings modal for configuration
- Support for multiple keyboard shortcuts
- localStorage persistence for settings
- Menu command in userscript manager
- Greasemonkey API integration
- MutationObserver for YouTube SPA handling
- Comprehensive CSS styling

### Features
- Block/Enable Number Keys (0-9)
- Block/Enable Spacebar
- Block/Enable Arrow Keys
- Block/Enable Ctrl+Left/Right (Chapter navigation)
- Block/Enable F Key (Fullscreen)
- Block/Enable M Key (Mute)
- Block/Enable Shift+<> (Speed control)
- Block/Enable . and , (Frame skip)
- Smart text detection (won't block while typing)
- Settings saved to browser storage

---

## [Unreleased]()

### Planned Features
- [ ] Hotkey profiles (save/load multiple configurations)
- [ ] Hotkey remapping functionality
- [ ] Video-type specific settings (exclude live streams, shorts, etc.)
- [ ] Channel whitelist/blacklist
- [ ] Custom hotkey combinations support
- [ ] Analytics dashboard (optional, privacy-respecting)
- [ ] Dark/Light theme toggle
- [ ] Export/Import settings to file
- [ ] Keyboard shortcut templates for common use cases
- [ ] Multi-language support
- [ ] Settings sync across devices (optional, encrypted)

### Under Consideration
- Browser extension version (not just userscript)
- Firefox Add-on official listing
- Chrome Web Store official listing
- Mobile browser support improvements
- Integration with other YouTube extensions
- Advanced logging for debugging
- Performance optimization for slower devices

---

## Version Numbering

- **Major (X.0)** - Breaking changes, significant features, major rewrites
- **Minor (0.Y)** - New features, improvements, non-breaking changes
- **Patch (0.0.Z)** - Bug fixes, documentation updates, minor improvements

---

## Release History

| Version | Date       | Status  | Notes                           |
| ------- | ---------- | ------- | ------------------------------- |
| 2.0     | 2026-01-19 | Latest  | Modern UI, fine-grained control |
| 1.0     | 2025-12-15 | Archive | Initial release                 |

---

## Security Notes

### Versions with Security Fixes
- None yet (project is new)

### Known Security Advisories
- None

---

## Breaking Changes

### From 1.0 to 2.0
- Default settings have changed (more hotkeys blocked by default)
- Settings key in localStorage changed from generic name to "hotkeySettings"
- UI completely redesigned (old settings won't carry over automatically)

**Migration:** Users upgrading from v1.0 will need to reconfigure their hotkey preferences.

---

## Deprecation Notices

### Currently Deprecated
- None

### Planned Deprecations
- Greasemonkey-only support (will require modern manager in v3.0)

---

## Contributing to Changelog

When submitting a PR, please update the changelog:

1. Add your changes under `[Unreleased]` section
2. Use appropriate subsections (Added, Changed, Fixed, etc.)
3. Reference GitHub issues if applicable (#issue-number)
4. Keep entries concise and user-focused

---

## Git Tags

Release tags follow format: `v2.0`, `v1.0`, etc.

To view a specific release:
```bash
git checkout tags/v2.0
```

---

## Download Releases

- [Latest (v2.0)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/tag/v2.0)
- [All Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases)

---

**Last Updated:** January 2026
