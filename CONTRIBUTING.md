# Contributing to YouTube Keystrokes Blocker

Thank you for considering contributing to YouTube Keystrokes Blocker! We welcome all kinds of contributions from the community.

---

## Ways to Contribute

### 1. Report Bugs
- Found a problem? [Open an issue](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
- Describe what happened and how to reproduce it
- Include your browser, OS, and userscript manager version
- Screenshots or error messages are helpful

### 2. Suggest Features
- Have an idea for improvement? [Start a discussion](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)
- Explain the feature and why it would be useful
- Include examples of how it would work
- Link related issues if applicable

### 3. Improve Documentation
- Found typos or unclear instructions?
- Documentation files are in `/docs/` folder
- Edit them and submit a PR
- Submit changes to README, installation guides, etc.

### 4. Submit Code
- Fix bugs
- Add features
- Improve performance
- Enhance UI/UX
- See "Pull Request Process" below

### 5. Test and Feedback
- Test on different browsers
- Report compatibility issues
- Test new features before release
- Provide feedback on proposed changes

---

## Getting Started

### Prerequisites
- GitHub account
- Git installed on your machine
- A browser with a userscript manager for testing
- Basic JavaScript knowledge (for code contributions)

### Set Up Development Environment

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR-USERNAME/Youtube-Keystrokes-Blocker.git
   cd Youtube-Keystrokes-Blocker
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker.git
   ```

4. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

---

## Development Process

### Before You Start
1. Check [open issues](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
2. Check [discussions](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)
3. Avoid duplicate work
4. Comment on issues to claim them

### Making Changes

1. **Edit `disable-yt-hotkeys.user.js`**
   - This is the main userscript file
   - Follow the existing code style
   - Add comments for complex logic
   - Test thoroughly before submitting

2. **Update documentation**
   - If adding features, update README.md
   - Update USAGE.md for user-facing changes
   - Update DEVELOPMENT.md for technical changes
   - Update CHANGELOG.md with your changes

3. **Update tests** (if applicable)
   - Write tests for new features
   - Ensure existing tests still pass

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add feature: description"
   ```

   Use clear, descriptive commit messages:
   - `fix: prevent spacebar blocking during typing`
   - `feat: add new hotkey configuration`
   - `docs: improve installation guide`
   - `style: improve modal CSS`

### Code Style Guidelines

#### JavaScript
```javascript
// Use clear variable names
const isTyping = target.tagName === "INPUT";

// Add comments for complex logic
// Check if user is actively typing in an input field
const target = e.target;
const isTyping = target.tagName === "INPUT" ||
                target.tagName === "TEXTAREA" ||
                target.isContentEditable;

// Use consistent indentation (2 spaces)
if (condition) {
  // Code here
}

// Use const/let, not var
const myVar = "value";
let counter = 0;

// Arrow functions where appropriate
const getValue = () => { /* ... */ };
```

#### HTML/CSS
```html
<!-- Use clear, semantic class names -->
<div class="yt-hk-modal">
  <div class="yt-hk-header">...</div>
  <div class="yt-hk-content">...</div>
  <div class="yt-hk-footer">...</div>
</div>
```

```css
/* Use CSS variables for consistency */
:root {
  --primary: #ff0033;
  --text-light: #f5f5f5;
}

.yt-hk-modal {
  background: var(--bg-card);
  color: var(--text-light);
}
```

---

## Testing Your Changes

### Manual Testing

1. **Load the modified script**
   - Open your userscript manager
   - Go to the script settings
   - Ensure auto-reload is enabled

2. **Test on YouTube**
   - Visit youtube.com
   - Open a video
   - Test the modified functionality
   - Check for console errors (F12)

3. **Test Different Scenarios**
   - Different video types
   - Different browsers
   - Different hotkey combinations
   - While typing in search/comments

4. **Check for Regressions**
   - Ensure existing features still work
   - Test all hotkeys
   - Verify settings save/load
   - Test modal open/close

### Browsers to Test
- Chrome/Chromium
- Firefox
- Edge
- Safari (if possible)

---

## Pull Request Process

### Before Submitting

1. **Update from upstream**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Test thoroughly**
   - Manual testing on multiple browsers
   - Check for console errors
   - Verify no regressions
   - Test edge cases

3. **Update documentation**
   - Update README if needed
   - Update CHANGELOG.md
   - Add comments to code
   - Update USAGE.md for user changes

4. **Clean up commits**
   ```bash
   git rebase -i upstream/main
   # Squash related commits if needed
   ```

### Submitting the Pull Request

1. **Push your branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Open Pull Request on GitHub**
   - Title: Clear, concise description
   - Description: Explain what you changed and why
   - Reference related issues: "Fixes #123"
   - Include testing notes

3. **PR Template**
   ```markdown
   ## Description
   Brief description of changes

   ## Related Issues
   Fixes #123
   Related to #456

   ## Type of Change
   - [ ] Bug fix (non-breaking change)
   - [ ] New feature (non-breaking change)
   - [ ] Breaking change
   - [ ] Documentation update

   ## Testing
   - [ ] Tested on Chrome
   - [ ] Tested on Firefox
   - [ ] Tested on other browser: ___
   - [ ] Settings save/load works
   - [ ] No console errors

   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Documentation updated
   - [ ] CHANGELOG.md updated
   - [ ] No new warnings
   - [ ] Code tested manually
   ```

### Review Process

1. **Maintainers will review your PR**
   - Code review for quality
   - Testing verification
   - Documentation review
   - Compatibility check

2. **Address feedback**
   - Make requested changes
   - Respond to comments
   - Push updates to same branch

3. **Merge**
   - Once approved, PR will be merged
   - Your contribution is now part of the project!

---

## Reporting Bugs

### Good Bug Report

A good bug report includes:

```markdown
## Description
What is the problem?

## Steps to Reproduce
1. First step
2. Second step
3. Expected result
4. Actual result

## Environment
- Browser: Chrome 120
- OS: Windows 11
- Userscript Manager: Tampermonkey v4.19
- Script Version: 2.0

## Screenshots
[Attach if applicable]

## Additional Context
Any other relevant information
```

### Bug Report Checklist
- [ ] Searched existing issues
- [ ] Reproducible issue
- [ ] Clear steps to reproduce
- [ ] Browser/OS information included
- [ ] Tested in incognito/private mode
- [ ] Updated userscript manager

---

## Feature Requests

### Good Feature Request

```markdown
## Description
What feature would you like?

## Use Case
Why do you need it?

## Proposed Solution
How should it work?

## Alternatives
Any alternatives considered?

## Additional Context
Screenshots, examples, references?
```

### Feature Request Checklist
- [ ] Checked existing issues
- [ ] Clear and concise description
- [ ] Explained why it's needed
- [ ] Not already possible with current features

---

## Documentation Contributions

### Documentation Files
- **README.md** - Project overview
- **docs/INSTALLATION.md** - Installation guide
- **docs/USAGE.md** - How to use the script
- **docs/DEVELOPMENT.md** - For developers
- **docs/FAQ.md** - Common questions
- **CHANGELOG.md** - Version history
- **CONTRIBUTING.md** - This file

### Documentation Style
- Clear, concise language
- Use headers for organization
- Include examples
- Add links to related sections
- Keep it up-to-date

---

## Code Review Guidelines

When reviewing others' contributions:
- Be respectful and constructive
- Suggest improvements kindly
- Ask questions if unclear
- Praise good work
- Focus on code quality
- Check for security issues
- Verify browser compatibility

---

## Community Guidelines

### Be Respectful
- Treat others with respect
- No harassment or discrimination
- Constructive criticism only
- Assume good intentions

### Be Helpful
- Help other contributors
- Answer questions kindly
- Share knowledge
- Support newcomers

### Be Honest
- Report issues accurately
- Don't spam or advertise
- Give credit where due
- Transparent communication

---

## Recognition

Contributors will be:
- Listed in the README
- Credited in the CHANGELOG
- Given GitHub recognition
- Thanked in releases

---

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.

---

## Questions?

- 📖 Check [Documentation](./docs/)
- 💬 Start a [Discussion](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/discussions)
- 🐛 [Report an Issue](https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/issues)
- 👤 Contact [@VKrishna04](https://github.com/VKrishna04)

---

## Additional Resources

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [How to Write Good Commit Messages](https://cbea.ms/git-commit/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)

---

**Thank you for contributing to YouTube Keystrokes Blocker! 🎉**

Your efforts help make this project better for everyone.

---

**Last Updated:** January 2026
