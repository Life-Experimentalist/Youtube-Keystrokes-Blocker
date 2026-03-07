// src/gm-shims.js — GM API shim layer for the browser extension context.
//
// NOTE: This file is intentionally left open at the bottom.
//       Build-Extension.ps1 appends the userscript core
//       (disable-yt-hotkeys.user.js with header + IIFE wrapper stripped)
//       then closes the async IIFE with  })();
//       The resulting file is written to src/content.js and packaged into
//       each browser ZIP.
//
// Storage strategy: chrome.storage.sync is loaded ONCE at script start so
// that GM_getValue / GM_setValue remain synchronous from the userscript's
// perspective — no changes to the userscript logic are required.

/* global chrome */

(async function () {
  "use strict";

  // ---------------------------------------------------------------------------
  // Pre-load all settings so GM_getValue can remain synchronous
  // ---------------------------------------------------------------------------
  const _store = await new Promise((resolve) =>
    chrome.storage.sync.get(null, (r) => resolve(r || {}))
  );

  // Keep _store in sync when the popup or options page saves changes.
  chrome.storage.onChanged.addListener((changes, area) => {
    if (area !== "sync") return;
    for (const [key, { newValue }] of Object.entries(changes)) {
      _store[key] = newValue;
    }
  });

  // ---------------------------------------------------------------------------
  // GM API shims
  // ---------------------------------------------------------------------------
  /* eslint-disable no-unused-vars */

  /** Synchronous read — backed by the pre-loaded _store cache. */
  function GM_getValue(key, defaultValue) {
    return key in _store ? _store[key] : defaultValue;
  }

  /** Update cache synchronously; persist to chrome.storage asynchronously. */
  function GM_setValue(key, value) {
    _store[key] = value;
    chrome.storage.sync.set({ [key]: value });
  }

  /** Inject a <style> element into the page. */
  function GM_addStyle(css) {
    const style = document.createElement("style");
    style.textContent = css;
    (document.head || document.documentElement).appendChild(style);
  }

  /** No-op: extension popup/options page replaces GM menu commands. */
  // eslint-disable-next-line no-unused-vars
  function GM_registerMenuCommand(_name, _fn) {}

  /** Minimal stub so userscript code can read the version via GM_info. */
  const GM_info = {
    script: { version: chrome.runtime.getManifest().version },
  };

  /* eslint-enable no-unused-vars */

  // ---------------------------------------------------------------------------
  // Userscript core — injected below by Build-Extension.ps1
  // ---------------------------------------------------------------------------
