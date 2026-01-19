# Development Guide

This guide is for developers who want to contribute to YouTube Keystrokes Blocker or understand how it works.

---

## Project Structure

```
Youtube-Keystrokes-Blocker/
├── disable-yt-hotkeys.user.js    # Main userscript file
├── index.html                      # GitHub Pages homepage
├── README.md                       # Project overview
├── docs/
│   ├── INSTALLATION.md            # Installation instructions
│   ├── USAGE.md                   # Usage guide
│   └── DEVELOPMENT.md             # This file
└── assets/
    └── (screenshots, images)
```

---

## How the Script Works

### 1. Script Initialization
```javascript
(function () {
  "use strict";

  // Load settings from browser storage
  let settings = GM_getValue("hotkeySettings", {
    // ... default settings
  });

  // Rest of script
})();
```

The script runs in an IIFE (Immediately Invoked Function Expression) to avoid polluting the global namespace.

### 2. Event Listener Setup
```javascript
window.addEventListener("keydown", function(e) {
  // Check if user is typing
  const isTyping = /* ... */;
  if (isTyping) return;

  // Check each configured hotkey
  if (settings.disableNumericKeys && e.key >= "0" && e.key <= "9") {
    e.preventDefault();
    e.stopPropagation();
    return;
  }
  // ... more hotkey checks
});
```

The script listens for `keydown` events and prevents default behavior based on settings.

### 3. UI Components

#### Settings Modal
- Created dynamically when keyboard icon is clicked
- Uses YouTube's color scheme for seamless integration
- Stores settings using `GM_setValue()`

#### Player Button
- Injected into YouTube's right-control bar
- Custom SVG keyboard icon
- Triggers settings modal on click

### 4. Settings Persistence
```javascript
// Save settings
GM_setValue("hotkeySettings", settings);

// Load settings
let settings = GM_getValue("hotkeySettings", {/* defaults */});
```

Uses Greasemonkey API for browser-independent storage.

---

## Key Functions

### `openSettings()`
- Removes existing modal
- Creates modal DOM structure
- Adds toggle switches for each hotkey
- Adds event listeners for save/close
- Applies CSS styling

### `addPlayerButton()`
- Finds YouTube's right controls
- Creates button with keyboard SVG
- Inserts before settings button
- Adds click handler

### Mutation Observer
```javascript
const observer = new MutationObserver((mutations) => {
  if (!document.getElementById("yt-hotkey-btn")) {
    addPlayerButton();
  }
});
observer.observe(document.body, { childList: true, subtree: true });
```

Detects when YouTube navigation changes (SPA) and re-adds button if needed.

---

## Technical Details

### Hotkey Detection

The script checks multiple event properties:
- `e.key` - Character representation ("5", "F", "M")
- `e.code` - Physical key ("ArrowLeft", "Space")
- `e.ctrlKey` - Ctrl modifier
- `e.shiftKey` - Shift modifier

### Input Detection
```javascript
const isTyping =
  target.tagName === "INPUT" ||
  target.tagName === "TEXTAREA" ||
  target.isContentEditable;
```

Prevents blocking keys when user is typing.

### CSS Styling
- Uses CSS variables for consistency
- Dark theme matching YouTube's interface
- Smooth transitions and animations
- Accessible toggle switches

---

## Making Changes

### Adding a New Hotkey

1. **Add to default settings:**
```javascript
let settings = GM_getValue("hotkeySettings", {
  // ... existing settings
  disableNewHotkey: true,  // Add here
});
```

2. **Add to modal options:**
```javascript
let options = [
  // ... existing options
  {
    id: "disableNewHotkey",
    label: 'Disable "X" Key',
    checked: settings.disableNewHotkey,
  },
];
```

3. **Add event listener check:**
```javascript
if (settings.disableNewHotkey && e.key.toLowerCase() === "x") {
  e.preventDefault();
  e.stopPropagation();
  return;
}
```

### Modifying UI

The modal is created dynamically in `openSettings()`. To change:
- Add/remove options from the `options` array
- Modify CSS in `GM_addStyle()` call
- Adjust modal dimensions or layout

### Testing Changes

1. Edit `disable-yt-hotkeys.user.js`
2. Go to YouTube in your browser
3. Your userscript manager auto-reloads changes
4. Refresh YouTube page
5. Test your changes

---

## Browser APIs Used

### Greasemonkey APIs
- `GM_registerMenuCommand()` - Menu option in manager
- `GM_setValue()` - Store data locally
- `GM_getValue()` - Load stored data
- `GM_addStyle()` - Inject CSS

### DOM APIs
- `document.createElement()` - Create elements
- `document.querySelector()` - Find elements
- `element.addEventListener()` - Listen to events
- `MutationObserver` - Watch for DOM changes

### Standard JavaScript
- `requestAnimationFrame()` - Smooth animations
- `setTimeout()` - Delayed actions
- `JSON` - Settings serialization

---

## Performance Considerations

### Why Event Listener Works Well
- `keydown` fires before default action
- Allows `preventDefault()` to block hotkey
- Low frequency event (only on key press)
- Minimal CPU usage

### Why MutationObserver is Safe
- Throttled to only check when DOM changes
- Only adds button if it's missing
- Doesn't interfere with YouTube's code
- Single observer for entire body

### Memory Management
- Settings loaded once on script load
- Modal created/destroyed only when needed
- Listener attached once, never removed
- No memory leaks or dangling references

---

## Browser Compatibility

### Supported APIs by Browser

| API                   | Chrome | Firefox | Edge | Safari |
| --------------------- | ------ | ------- | ---- | ------ |
| addEventListener      | ✓      | ✓       | ✓    | ✓      |
| MutationObserver      | ✓      | ✓       | ✓    | ✓      |
| GM_getValue/setValue  | ✓      | ✓       | ✓    | ✓      |
| requestAnimationFrame | ✓      | ✓       | ✓    | ✓      |

All features work on all modern browsers with userscript support.

---

## Common Issues & Solutions

### Issue: Changes don't apply
**Solution:** Refresh YouTube page (F5) to reload script

### Issue: Settings modal doesn't appear
**Solution:** Check browser console (F12) for errors

### Issue: Hotkeys still work when toggled ON
**Solution:** Ensure `e.preventDefault()` is called

### Issue: Settings don't persist
**Solution:** Check that `GM_setValue()` is being called

---

## Contributing Guidelines

### Before Contributing
1. Fork the repository
2. Clone to your local machine
3. Create a feature branch
4. Make your changes
5. Test thoroughly on YouTube
6. Submit a pull request

### Code Style
- Use consistent indentation (2 spaces)
- Clear variable names
- Comments for complex logic
- No unnecessary dependencies

### Testing Checklist
- [ ] Script loads without errors
- [ ] All hotkeys can be toggled
- [ ] Settings save properly
- [ ] Settings persist on refresh
- [ ] Keyboard icon visible
- [ ] Works on multiple YouTube pages
- [ ] No interference with typing
- [ ] Smooth animations
- [ ] Mobile responsiveness (if applicable)

### Documentation
- Update README.md if adding features
- Document new settings in docs/USAGE.md
- Add version notes to CHANGELOG
- Update installation guide if needed

---

## Version Management

### Version Format: MAJOR.MINOR

- **MAJOR:** Breaking changes or significant features
- **MINOR:** Bug fixes and small improvements

### Update Process
1. Make changes and test locally
2. Update version in script header
3. Update version in docs if needed
4. Commit with version bump message
5. Push to main branch
6. Create GitHub release

---

## Future Improvements

Potential enhancements for future versions:
- [ ] Keyboard shortcut profiles (save/load multiple configs)
- [ ] Hotkey remapping (reassign keys)
- [ ] Video type exclusions (don't block on live streams)
- [ ] Whitelist/blacklist channels
- [ ] Custom hotkey combinations
- [ ] Statistics tracking (which keys are pressed)
- [ ] Dark/light theme toggle in modal
- [ ] Export/import settings

---

## Getting Help

📧 **Questions?** Open a discussion on GitHub
🐛 **Found a bug?** Report it on GitHub Issues
💡 **Have an idea?** Start a discussion or submit a PR

---

## Related Resources

- [Tampermonkey Documentation](https://www.tampermonkey.net/documentation.php)
- [MDN: Window.addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/Window/addEventListener)
- [MDN: MutationObserver](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver)
- [YouTube Player API](https://developers.google.com/youtube/iframe_api_reference)

---

**Last Updated:** January 2026
