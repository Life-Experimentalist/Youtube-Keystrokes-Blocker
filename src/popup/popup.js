// popup.js — YouTube Keystrokes Blocker toolbar popup

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

const BASE_OPTIONS = [
  { id: "disableNumericKeys", label: "Disable Numbers (0–9)" },
  { id: "disableSpacebar", label: "Disable Spacebar" },
  { id: "disableHorizontalArrows", label: "Disable ← → (seek)" },
  { id: "disableVerticalArrows", label: "Disable ↑ ↓ (volume)" },
  { id: "disableCtrlLeft", label: "Disable Ctrl + ←" },
  { id: "disableCtrlRight", label: "Disable Ctrl + →" },
  { id: "disableFKey", label: "Disable F (fullscreen)" },
  { id: "disableMKey", label: "Disable M (mute)" },
  { id: "disableVKey", label: "Disable V (captions)" },
  { id: "disableSpeedControl", label: "Disable Speed (Shift+<>)" },
  { id: "disableFrameSkip", label: "Disable Frame Skip (,/.)" },
];

const ADVANCED_OPTIONS = [
  { id: "disablePlayPauseK", label: "Play/Pause (k)" },
  { id: "disableRewindJ", label: "Rewind (j)" },
  { id: "disableFastForwardL", label: "Fast Forward (l)" },
  { id: "disablePreviousVideoP", label: "Previous Video (Shift+P)" },
  { id: "disableNextVideoN", label: "Next Video (Shift+N)" },
  { id: "disableTheatreModeT", label: "Theatre Mode (t)" },
  { id: "disableMiniPlayerI", label: "Miniplayer (i)" },
  { id: "disableCloseDialogEsc", label: "Escape (close dialog)" },
  { id: "disableCaptionsC", label: "Captions (c)" },
  { id: "disableTextOpacityO", label: "Text Opacity (o)" },
  { id: "disableWindowOpacityW", label: "Window Opacity (w)" },
  { id: "disableFontIncrease", label: "Font Size + (+)" },
  { id: "disableFontDecrease", label: "Font Size – (−)" },
  { id: "disablePanUpW", label: "Pan Up (w)" },
  { id: "disablePanLeftA", label: "Pan Left (a)" },
  { id: "disablePanDownS", label: "Pan Down (s)" },
  { id: "disablePanRightD", label: "Pan Right (d)" },
  { id: "disableZoomIn", label: "Zoom In (+/])" },
  { id: "disableZoomOut", label: "Zoom Out (−/[)" },
  { id: "disableShiftSlash", label: "Shortcuts Help (Shift+/)" },
];

function buildRows(options, container, currentSettings) {
  options.forEach(({ id, label }) => {
    const row = document.createElement("div");
    row.className = "row";

    const lbl = document.createElement("span");
    lbl.textContent = label;

    const sw = document.createElement("label");
    sw.className = "switch";

    const input = document.createElement("input");
    input.type = "checkbox";
    input.id = id;
    input.checked = !!currentSettings[id];

    const slider = document.createElement("span");
    slider.className = "slider";

    sw.append(input, slider);
    row.append(lbl, sw);
    container.appendChild(row);
  });
}

function readCheckboxes(options) {
  const result = {};
  options.forEach(({ id }) => {
    const el = document.getElementById(id);
    if (el) result[id] = el.checked;
  });
  return result;
}

document.addEventListener("DOMContentLoaded", () => {
  // Display version
  const manifest = chrome.runtime.getManifest();
  document.getElementById("version").textContent = `v${manifest.version}`;

  // Open full options page
  document.getElementById("open-options").addEventListener("click", (e) => {
    e.preventDefault();
    chrome.runtime.openOptionsPage();
  });

  // Advanced toggle
  const advancedToggle = document.getElementById("advanced-toggle");
  const advancedRows = document.getElementById("advanced-rows");
  advancedToggle.addEventListener("click", () => {
    const open = advancedRows.classList.toggle("open");
    advancedToggle.textContent = open
      ? "Hide extra controls ▴"
      : "Show more controls ▾";
  });

  // Load settings then build UI
  chrome.storage.sync.get(DEFAULT_SETTINGS, (currentSettings) => {
    buildRows(
      BASE_OPTIONS,
      document.getElementById("base-rows"),
      currentSettings,
    );
    buildRows(
      ADVANCED_OPTIONS,
      document.getElementById("advanced-rows"),
      currentSettings,
    );

    // Reset button
    document.getElementById("reset-btn").addEventListener("click", () => {
      chrome.storage.sync.set(DEFAULT_SETTINGS, () => {
        [...BASE_OPTIONS, ...ADVANCED_OPTIONS].forEach(({ id }) => {
          const el = document.getElementById(id);
          if (el) el.checked = DEFAULT_SETTINGS[id];
        });
        const btn = document.getElementById("reset-btn");
        btn.textContent = "Reset ✓";
        setTimeout(() => {
          btn.textContent = "Reset";
        }, 1200);
      });
    });

    // Save button
    document.getElementById("save-btn").addEventListener("click", () => {
      const newSettings = {
        ...readCheckboxes(BASE_OPTIONS),
        ...readCheckboxes(ADVANCED_OPTIONS),
      };
      chrome.storage.sync.set(newSettings, () => {
        const btn = document.getElementById("save-btn");
        btn.textContent = "Saved!";
        btn.style.background = "#00cc00";
        setTimeout(() => {
          btn.textContent = "Save";
          btn.style.background = "";
        }, 1000);
      });
    });
  });
});
