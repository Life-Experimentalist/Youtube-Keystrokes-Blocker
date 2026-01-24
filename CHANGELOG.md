# Changelog

All notable changes to YouTube Keystrokes Blocker will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [4.5](./docs/Release%20Notes/RELEASE_NOTES_v4.5.md) - 2026-01-25

### Added
- **`Playback Controls`** Added toggles for all major playback hotkeys: Play/Pause (k), Rewind (j), Fast Forward (l), Previous Video (Shift+p), Next Video (Shift+n)
- **`Advanced Hotkeys`** Comprehensive controls for subtitle/caption features: Captions (c), Text Opacity (o), Window Opacity (w), Font Size +/- (+/-)
- **`Spherical Video Controls`** Full support for panoramic video gestures: Pan Up/Down/Left/Right (w/s/a/d), Zoom In/Out (+ on numpad or `]`, - on numpad or `[`)
- **`UI/Playback Modes`** New toggles for Theatre Mode (t), Miniplayer (i), Keyboard Shortcuts window (Shift+/)
- **`Expandable Settings`** "Show more controls" section with scrollable content area to prevent modal overflow
- **`Independent Arrow Control`** Split arrow key controls into Left/Right and Up/Down for granular blocking while preserving Ctrl+Arrow combinations
- **`Keyboard Shortcuts Button`** Direct access to YouTube's keyboard shortcuts help dialog from settings modal (works even when Shift+/ is disabled)
- **`Spacebar Fix`** Strengthened spacebar detection with multiple event types (keydown/keypress/keyup) and multiple key identifiers

### Changed
- Modal width increased to 420px to accommodate more settings without scrolling
- Default settings now include all 30+ supported hotkeys with independent toggles
- V key (Captions toggle) now has its own control separate from other features
- Settings seeded from fresh values on modal open (prevents stale checkboxes)
- Reset to Defaults now properly updates all toggles including advanced section

### Fixed
- **`Critical`** Spacebar blocking now works reliably across all keyboard events
- **`Critical`** Settings persist correctly after save and modal reopen
- **`Critical`** F/M key and all other single-key shortcuts properly gated by their toggle (not always-on)
- Ctrl+Left/Right now independent from plain Left/Right arrow blocking
- Modal scrolling prevents content overflow on smaller screens
- Settings merge with defaults on load to ensure no missing keys
- Shift+/ keyboard shortcut help window accessible even when disabled

### UI/UX Improvements
- Cleaner label formatting: brief description + key in parentheses (e.g., "Play/Pause (k)")
- Better visual hierarchy with scrollable advanced section
- Reset and Shortcuts buttons now clearly visible in footer
- Improved button styling with hover feedback
- Version number displayed in modal header

### Testing & Validation
- All 30+ hotkeys verified for independent blocking
- Cross-browser compatibility maintained
- Settings persistence validated on reopen
- Modal overflow handled with scrollbar
- Keyboard event detection tested across keydown/keypress/keyup

---

## [4.4](./docs/Release%20Notes/RELEASE_NOTES_v4.4.md) - 2026-01-24

### Added
- **`Timing Fix`** Improved button injection reliability on first page load
- **`Events`** Added proper YouTube SPA navigation event listeners (`yt-navigate-finish`, `yt-page-data-updated`)
- **`Retry Logic`** Implemented exponential backoff for DOM element detection
- **`Automation`** Created PowerShell scripts for automated version management
- **`CI/CD`** Added GitHub Actions workflow for validation
- **`Package Management`** Added package.json with npm/uv script shortcuts

### Changed
- Enhanced initialization logic to wait for specific DOM elements before injection
- Better handling of YouTube's dynamic content loading
- Replaced polling-based injection with event-driven approach
- Improved documentation with automation guides

### Fixed
- **`Critical`** Fixed race condition causing button to not appear on first video load
- Improved compatibility with YouTube's updated UI structure
- Button now appears reliably without requiring page refresh

### Developer Experience
- Version updates now automated across all files (userscript, manifest, README)
- New npm scripts: `version:patch`, `version:minor`, `version:major`, `release`
- Comprehensive automation documentation in `scripts/README.md`

---

## [4.3](./docs/Release%20Notes/RELEASE_NOTES_v4.3.md) - 2026-01-23

### Added
- **`Settings`** Smart settings reloading with real-time synchronization
- **`Hotkey Detection`** Enhanced spacebar detection for both `Space` code and `" "` key
- **`UI Feedback`** Visual confirmation when settings are saved (green "Saved!" button)
- **`Multi-Selector Injection`** Fallback system for button injection across varying YouTube layouts
- **`Retry Logic`** Periodic injection attempts with graceful failure handling
- **`Menu Fallback`** Tampermonkey menu access to settings as backup option

### Changed
- Settings now fetched fresh on every keystroke (not cached)
- Improved F/M key detection for case-insensitive handling
- Enhanced button injection with multiple selector strategies
- Better modal close behavior with 500ms delay for confirmation

### Fixed
- Settings not persisting correctly on first install (spacebar setting)
- Inconsistent F/M key detection across keyboard layouts
- Settings changes requiring page refresh
- Better compatibility with YouTube's varying DOM structures

### Infrastructure
- Updated manifest version to 3.0 (modern Chrome extension standard)
- Added explicit browser compatibility declarations
- Updated download/update URLs from Greasy Fork to raw GitHub
- Better distribution and faster update propagation

---

## [4.2](./docs/Release%20Notes/RELEASE_NOTES_v4.2.md) - 2026-01-20

### Changed
- Increased modal text font sizes for better readability
  - Header title: 16px → 18px
  - Close button: 24px → 28px
  - Row labels: now 15px (was inheriting default)
  - Save button: 14px → 15px
- Enhanced save button styling
  - Border radius: 2px → 8px (more rounded corners)
  - Padding increased: 8px 16px → 10px 18px
- Removed fixed height constraint on modal content
  - Eliminated scrollbar in favor of flexible height
  - Modal now automatically expands to fit all options

### Improved
- Better visual hierarchy with larger, clearer text
- Smoother button aesthetics with rounded corners
- More accessible interface with increased font sizes
- Cleaner modal appearance without scrollbars

---

## [4.1](./docs/Release%20Notes/RELEASE_NOTES_v4.1.md) - 2026-01-19

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

Release tags follow format: `v4.0`, `v4.5`, etc.

To view a specific release:
```powershell
git checkout tags/v4.5
```

---

## Download Releases

- [Latest (v2.0)](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/tag/v2.0)
- [All Releases](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases)

---

**Last Updated:** January 2026
