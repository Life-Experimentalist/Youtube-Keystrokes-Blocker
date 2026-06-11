#!/usr/bin/env node
// scripts/update-version.js — Bump version across all project files.
// Usage: node scripts/update-version.js --type patch|minor|major
//        node scripts/update-version.js --version X.Y.Z

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, "..");

function bumpVersion(current, type) {
  const parts = current.split(".").map(Number);
  while (parts.length < 3) parts.push(0);
  if (type === "major") return `${parts[0] + 1}.0.0`;
  if (type === "minor") return `${parts[0]}.${parts[1] + 1}.0`;
  if (type === "patch") return `${parts[0]}.${parts[1]}.${parts[2] + 1}`;
  throw new Error(`Unknown bump type: ${type}`);
}

// ---------------------------------------------------------------------------
// Parse args
// ---------------------------------------------------------------------------
const args = process.argv.slice(2);
let newVersion;

if (args.includes("--version")) {
  newVersion = args[args.indexOf("--version") + 1];
} else if (args.includes("--type")) {
  const type = args[args.indexOf("--type") + 1];
  if (!["major", "minor", "patch"].includes(type)) {
    console.error(`Unknown type: ${type}. Use major, minor, or patch.`);
    process.exit(1);
  }
  const pkg = JSON.parse(
    fs.readFileSync(path.join(ROOT, "package.json"), "utf8")
  );
  newVersion = bumpVersion(pkg.version, type);
} else {
  console.error("Usage: node scripts/update-version.js --type patch|minor|major");
  console.error("       node scripts/update-version.js --version X.Y.Z");
  process.exit(1);
}

if (!/^\d+\.\d+\.\d+$/.test(newVersion)) {
  console.error("Version must be X.Y.Z format (e.g. 5.1.0)");
  process.exit(1);
}

// ---------------------------------------------------------------------------
// Read current version for display
// ---------------------------------------------------------------------------
const pkgPath = path.join(ROOT, "package.json");
const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8"));
const oldVersion = pkg.version;

console.log(`\nUpdating: ${oldVersion} → ${newVersion}\n`);

// ---------------------------------------------------------------------------
// Update files
// ---------------------------------------------------------------------------

// package.json
pkg.version = newVersion;
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + "\n", "utf8");
console.log("[OK] package.json");

// manifest.chrome.json
const chromePath = path.join(ROOT, "src", "manifests", "manifest.chrome.json");
const cm = JSON.parse(fs.readFileSync(chromePath, "utf8"));
cm.version = newVersion;
fs.writeFileSync(chromePath, JSON.stringify(cm, null, 4) + "\n", "utf8");
console.log("[OK] manifest.chrome.json");

// manifest.firefox.json
const ffPath = path.join(ROOT, "src", "manifests", "manifest.firefox.json");
const fm = JSON.parse(fs.readFileSync(ffPath, "utf8"));
fm.version = newVersion;
fs.writeFileSync(ffPath, JSON.stringify(fm, null, 4) + "\n", "utf8");
console.log("[OK] manifest.firefox.json");

// MANIFEST.json (top-level legacy file, if present)
const legacyPath = path.join(ROOT, "MANIFEST.json");
if (fs.existsSync(legacyPath)) {
  const lm = JSON.parse(fs.readFileSync(legacyPath, "utf8"));
  lm.version = newVersion;
  fs.writeFileSync(legacyPath, JSON.stringify(lm, null, 4) + "\n", "utf8");
  console.log("[OK] MANIFEST.json");
}

// disable-yt-hotkeys.user.js — @version tag
const userscriptPath = path.join(ROOT, "disable-yt-hotkeys.user.js");
let us = fs.readFileSync(userscriptPath, "utf8");
us = us.replace(/@version\s+[\d.]+/, `@version      ${newVersion}`);
fs.writeFileSync(userscriptPath, us, "utf8");
console.log("[OK] disable-yt-hotkeys.user.js");

// README.md — version badge URLs (version-X.Y.Z pattern)
const readmePath = path.join(ROOT, "README.md");
if (fs.existsSync(readmePath)) {
  let readme = fs.readFileSync(readmePath, "utf8");
  readme = readme.replace(/version-[\d.]+/g, `version-${newVersion}`);
  fs.writeFileSync(readmePath, readme, "utf8");
  console.log("[OK] README.md");
}

// CHANGELOG.md — prepend new version stub under [Unreleased] or at top
const changelogPath = path.join(ROOT, "CHANGELOG.md");
if (fs.existsSync(changelogPath)) {
  let cl = fs.readFileSync(changelogPath, "utf8");
  if (!cl.includes(`[${newVersion}]`)) {
    const today = new Date().toISOString().slice(0, 10);
    const stub = `\n\n## [${newVersion}] - ${today}\n\n### Added\n-\n\n### Changed\n-\n\n### Fixed\n-`;
    if (cl.match(/##\s+\[Unreleased\]/)) {
      cl = cl.replace(/(##\s+\[Unreleased\][^\n]*\n)/, `$1${stub}\n`);
    } else {
      cl = cl.replace(/(##\s+\[\d)/, `${stub}\n\n$1`);
    }
    fs.writeFileSync(changelogPath, cl, "utf8");
    console.log("[OK] CHANGELOG.md");
  } else {
    console.log(`[SKIP] CHANGELOG.md already has [${newVersion}]`);
  }
}

// ---------------------------------------------------------------------------
// Summary
// ---------------------------------------------------------------------------
console.log(`\n[DONE] ${oldVersion} → ${newVersion}`);
console.log("\nNext steps:");
console.log("  1. Review CHANGELOG.md and fill in the new entries");
console.log("  2. npm run build          (verify build works)");
console.log(`  3. git add -A && git commit -m "chore: bump version to ${newVersion}"`);
console.log(`  4. git tag v${newVersion}`);
console.log(`  5. git push && git push --tags   (triggers GitHub Actions release)\n`);
