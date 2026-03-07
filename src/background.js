// background.js — MV3 Service Worker
// Minimal: sets default settings on install and keeps the service worker alive for storage changes.

const DEFAULT_SETTINGS = {
  disableNumericKeys: true,
  disableMKey: true,
  disableCtrlLeft: true,
  disableCtrlRight: true,
  disableSpacebar: false,
  disableHorizontalArrows: false,
  disableVerticalArrows: false,
  disablePlayPauseK: false,
  disableRewindJ: false,
  disableFastForwardL: false,
  disablePreviousVideoP: false,
  disableNextVideoN: false,
  disableFKey: false,
  disableVKey: false,
  disableTheatreModeT: false,
  disableMiniPlayerI: false,
  disableCloseDialogEsc: false,
  disableCaptionsC: false,
  disableTextOpacityO: false,
  disableWindowOpacityW: false,
  disableFontIncrease: false,
  disableFontDecrease: false,
  disablePanUpW: false,
  disablePanLeftA: false,
  disablePanDownS: false,
  disablePanRightD: false,
  disableZoomIn: false,
  disableZoomOut: false,
  disableShiftSlash: false,
  disableSpeedControl: false,
  disableFrameSkip: false,
};

// On first install, seed storage with defaults (won't overwrite existing settings on update).
chrome.runtime.onInstalled.addListener(async (details) => {
  if (details.reason === "install") {
    const existing = await chrome.storage.sync.get(null);
    // Only write keys that are missing
    const toSet = {};
    for (const [key, value] of Object.entries(DEFAULT_SETTINGS)) {
      if (!(key in existing)) toSet[key] = value;
    }
    if (Object.keys(toSet).length > 0) {
      await chrome.storage.sync.set(toSet);
    }
  }
});
