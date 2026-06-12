#!/usr/bin/env node
// scripts/build.js — Build YouTube Keystrokes Blocker for Chrome/Edge and Firefox.
// Usage: node scripts/build.js [--browser chrome|firefox|all] [--dev]
//   --browser   Target browser (default: all)
//   --dev       Skip ZIP, leave build/ dir for unpacked-extension testing

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, "..");
const SRC = path.join(ROOT, "src");
const MANIFESTS = path.join(SRC, "manifests");
const RELEASE = path.join(ROOT, "release");

// ---------------------------------------------------------------------------
// CLI args
// ---------------------------------------------------------------------------
const args = process.argv.slice(2);
const browserArg = args.includes("--browser")
  ? args[args.indexOf("--browser") + 1]
  : "all";
const isDev = args.includes("--dev");

if (!["chrome", "firefox", "all"].includes(browserArg)) {
  console.error(`Unknown browser: ${browserArg}. Use chrome, firefox, or all.`);
  process.exit(1);
}

// ---------------------------------------------------------------------------
// Version (source of truth: manifest.chrome.json)
// ---------------------------------------------------------------------------
const chromeManifest = JSON.parse(
  fs.readFileSync(path.join(MANIFESTS, "manifest.chrome.json"), "utf8")
);
const VERSION = chromeManifest.version;
console.log(`\n[*] Building version: v${VERSION}`);

// ---------------------------------------------------------------------------
// Assemble content.js from gm-shims.js + userscript core
// ---------------------------------------------------------------------------
function assembleContentJs() {
  console.log("[*] Assembling content.js...");

  const shims = fs.readFileSync(path.join(SRC, "gm-shims.js"), "utf8");
  let userscript = fs.readFileSync(
    path.join(ROOT, "disable-yt-hotkeys.user.js"),
    "utf8"
  );

  // Normalize line endings
  userscript = userscript.replace(/\r\n/g, "\n").replace(/\r/g, "\n");

  // Extract body: everything after the IIFE opening + "use strict" line
  const iifeOpen = '(function () {\n  "use strict";\n';
  const openIdx = userscript.indexOf(iifeOpen);
  if (openIdx < 0)
    throw new Error("Could not find IIFE opening in userscript. Check file format.");

  let core = userscript.substring(openIdx + iifeOpen.length);

  // Strip the closing })(); from the end
  const iifeClose = "\n})();";
  const closeIdx = core.lastIndexOf(iifeClose);
  if (closeIdx >= 0) core = core.substring(0, closeIdx);
  core = core.trimEnd();

  const contentJs =
    shims +
    "\n  // === Userscript core (disable-yt-hotkeys.user.js) ===\n" +
    core +
    "\n\n})();";

  fs.writeFileSync(path.join(SRC, "content.js"), contentJs, "utf8");
  console.log(`   [OK] content.js (${Math.round(contentJs.length / 1024)} KB)`);
}

// ---------------------------------------------------------------------------
// Generate icon PNGs using sharp (Chrome/Edge only — Firefox uses SVG)
// ---------------------------------------------------------------------------
async function generateIcons(iconsDir) {
  const { default: sharp } = await import("sharp");
  const svgBuffer = fs.readFileSync(path.join(SRC, "icons", "icon.svg"));
  for (const size of [16, 48, 128]) {
    const outPath = path.join(iconsDir, `icon${size}.png`);
    await sharp(svgBuffer).resize(size, size).png().toFile(outPath);
    console.log(`   [OK] icon${size}.png`);
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
const SKIP_FILES = new Set(["desktop.ini", "Thumbs.db", ".DS_Store"]);

function copyDir(src, dest) {
  fs.mkdirSync(dest, { recursive: true });
  for (const entry of fs.readdirSync(src, { withFileTypes: true })) {
    if (SKIP_FILES.has(entry.name)) continue;
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) copyDir(srcPath, destPath);
    else fs.copyFileSync(srcPath, destPath);
  }
}

async function createZip(sourceDir, zipPath) {
  const { default: archiver } = await import("archiver");
  return new Promise((resolve, reject) => {
    const output = fs.createWriteStream(zipPath);
    const archive = archiver("zip", { zlib: { level: 9 } });
    output.on("close", resolve);
    archive.on("error", reject);
    archive.pipe(output);
    archive.directory(sourceDir, false);
    archive.finalize();
  });
}

// ---------------------------------------------------------------------------
// Build one browser package
// ---------------------------------------------------------------------------
async function buildBrowser(browser) {
  console.log(`\n[BUILD] ${browser}`);

  const buildDir = path.join(ROOT, "build", browser);
  if (fs.existsSync(buildDir)) fs.rmSync(buildDir, { recursive: true });
  fs.mkdirSync(buildDir, { recursive: true });

  // Icons
  const iconsDir = path.join(buildDir, "icons");
  fs.mkdirSync(iconsDir);
  if (browser === "firefox") {
    fs.copyFileSync(
      path.join(SRC, "icons", "icon.svg"),
      path.join(iconsDir, "icon.svg")
    );
    console.log("   [OK] icon.svg (Firefox)");
  } else {
    await generateIcons(iconsDir);
  }

  // Manifest (browser-specific → manifest.json in the build)
  const manifestFile =
    browser === "firefox" ? "manifest.firefox.json" : "manifest.chrome.json";
  fs.copyFileSync(
    path.join(MANIFESTS, manifestFile),
    path.join(buildDir, "manifest.json")
  );

  // Core extension files
  fs.copyFileSync(path.join(SRC, "content.js"), path.join(buildDir, "content.js"));
  fs.copyFileSync(path.join(SRC, "content.css"), path.join(buildDir, "content.css"));
  fs.copyFileSync(path.join(SRC, "background.js"), path.join(buildDir, "background.js"));

  // Popup & options pages
  copyDir(path.join(SRC, "popup"), path.join(buildDir, "popup"));
  copyDir(path.join(SRC, "options"), path.join(buildDir, "options"));

  if (isDev) {
    console.log(`   [DEV] Unpacked build ready at: build/${browser}/`);
    console.log(`   [DEV] Load this folder as an unpacked extension in your browser.`);
    return;
  }

  // ZIP
  const zipName = `youtube-hotkeys-blocker-v${VERSION}-${browser}.zip`;
  const zipPath = path.join(RELEASE, zipName);
  if (fs.existsSync(zipPath)) fs.rmSync(zipPath);
  await createZip(buildDir, zipPath);
  console.log(`   [OK] release/${zipName}`);

  // Cleanup temp build dir
  fs.rmSync(buildDir, { recursive: true });
}

// ---------------------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------------------
async function main() {
  fs.mkdirSync(RELEASE, { recursive: true });

  assembleContentJs();

  const browsers = browserArg === "all" ? ["chrome", "firefox"] : [browserArg];
  for (const b of browsers) await buildBrowser(b);

  if (!isDev) {
    // Copy userscript as a release artifact
    const userscriptName = `youtube-hotkeys-blocker-v${VERSION}-userscript.user.js`;
    fs.copyFileSync(
      path.join(ROOT, "disable-yt-hotkeys.user.js"),
      path.join(RELEASE, userscriptName)
    );
    console.log(`\n   [OK] ${userscriptName}`);
  }

  console.log(`\n[DONE] Build complete. Artifacts in: release/\n`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
