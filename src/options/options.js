// options.js — YouTube Keystrokes Blocker full settings page

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

// ---- Section definitions ----
const SECTIONS = {
  "base-rows": [
    {
      id: "disableNumericKeys",
      label: "Disable Numbers (0–9)",
      desc: "Jump to a percentage of the video timeline",
    },
    { id: "disableSpacebar", label: "Disable Spacebar", desc: "Play / Pause" },
    {
      id: "disableHorizontalArrows",
      label: "Disable ← → (seek)",
      desc: "Seek forward/backward 5 seconds",
    },
    {
      id: "disableVerticalArrows",
      label: "Disable ↑ ↓ (volume)",
      desc: "Raise or lower volume",
    },
    {
      id: "disableCtrlLeft",
      label: "Disable Ctrl + ←",
      desc: "Jump to previous chapter",
    },
    {
      id: "disableCtrlRight",
      label: "Disable Ctrl + →",
      desc: "Jump to next chapter",
    },
    {
      id: "disableFKey",
      label: "Disable F (fullscreen)",
      desc: "Toggle fullscreen mode",
    },
    { id: "disableMKey", label: "Disable M (mute)", desc: "Toggle mute" },
    {
      id: "disableVKey",
      label: "Disable V (captions toggle)",
      desc: "Toggle subtitle/caption visibility",
    },
    {
      id: "disableSpeedControl",
      label: "Disable Speed (Shift + < / >)",
      desc: "Decrease or increase playback speed",
    },
    {
      id: "disableFrameSkip",
      label: "Disable Frame Skip (, / .)",
      desc: "Skip one frame backward or forward (paused)",
    },
  ],
  "playback-rows": [
    {
      id: "disablePlayPauseK",
      label: "Play/Pause (k)",
      desc: "Alternate play/pause shortcut",
    },
    {
      id: "disableRewindJ",
      label: "Rewind 10 s (j)",
      desc: "Seek back 10 seconds",
    },
    {
      id: "disableFastForwardL",
      label: "Fast Forward 10 s (l)",
      desc: "Seek forward 10 seconds",
    },
    {
      id: "disablePreviousVideoP",
      label: "Previous Video (Shift + P)",
      desc: "Navigate to the previous video",
    },
    {
      id: "disableNextVideoN",
      label: "Next Video (Shift + N)",
      desc: "Navigate to the next video",
    },
    {
      id: "disableShiftSlash",
      label: "Keyboard Shortcuts Help (Shift + /)",
      desc: "Open YouTube's shortcuts overlay",
    },
  ],
  "captions-rows": [
    {
      id: "disableCaptionsC",
      label: "Captions (c)",
      desc: "Toggle closed captions",
    },
    {
      id: "disableTextOpacityO",
      label: "Text Opacity (o)",
      desc: "Cycle subtitle text opacity",
    },
    {
      id: "disableWindowOpacityW",
      label: "Window Opacity (w)",
      desc: "Cycle subtitle background opacity",
    },
    {
      id: "disableFontIncrease",
      label: "Font Size + (+)",
      desc: "Increase caption font size",
    },
    {
      id: "disableFontDecrease",
      label: "Font Size – (−)",
      desc: "Decrease caption font size",
    },
  ],
  "view-rows": [
    {
      id: "disableTheatreModeT",
      label: "Theatre Mode (t)",
      desc: "Toggle theatre / default view",
    },
    {
      id: "disableMiniPlayerI",
      label: "Miniplayer (i)",
      desc: "Toggle picture-in-picture miniplayer",
    },
    {
      id: "disableCloseDialogEsc",
      label: "Escape (close dialog)",
      desc: "Close dialogs / exit fullscreen",
    },
  ],
  "spherical-rows": [
    {
      id: "disablePanUpW",
      label: "Pan Up (w)",
      desc: "Pan the camera upward in 360° video",
    },
    {
      id: "disablePanDownS",
      label: "Pan Down (s)",
      desc: "Pan the camera downward",
    },
    {
      id: "disablePanLeftA",
      label: "Pan Left (a)",
      desc: "Pan the camera left",
    },
    {
      id: "disablePanRightD",
      label: "Pan Right (d)",
      desc: "Pan the camera right",
    },
    {
      id: "disableZoomIn",
      label: "Zoom In (+ / ])",
      desc: "Zoom into the spherical view",
    },
    {
      id: "disableZoomOut",
      label: "Zoom Out (− / [)",
      desc: "Zoom out of the spherical view",
    },
  ],
};

function buildRows(options, container, currentSettings) {
  options.forEach(({ id, label, desc }) => {
    const row = document.createElement("div");
    row.className = "row";

    const info = document.createElement("div");

    const lbl = document.createElement("div");
    lbl.textContent = label;

    info.appendChild(lbl);

    if (desc) {
      const sub = document.createElement("div");
      sub.style.fontSize = "11px";
      sub.style.color = "#777";
      sub.style.marginTop = "2px";
      sub.textContent = desc;
      info.appendChild(sub);
    }

    const sw = document.createElement("label");
    sw.className = "switch";

    const input = document.createElement("input");
    input.type = "checkbox";
    input.id = id;
    input.checked = !!currentSettings[id];

    const slider = document.createElement("span");
    slider.className = "slider";

    sw.append(input, slider);
    row.append(info, sw);
    container.appendChild(row);
  });
}

function showStatus(msg, isError = false) {
  const bar = document.getElementById("status-bar");
  bar.textContent = msg;
  bar.style.color = isError ? "#f44336" : "#4caf50";
  bar.classList.add("visible");
  setTimeout(() => {
    bar.classList.remove("visible");
    setTimeout(() => {
      bar.textContent = "";
    }, 300);
  }, 2500);
}

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("version").textContent =
    `v${chrome.runtime.getManifest().version}`;

  chrome.storage.sync.get(DEFAULT_SETTINGS, (currentSettings) => {
    for (const [containerId, options] of Object.entries(SECTIONS)) {
      buildRows(options, document.getElementById(containerId), currentSettings);
    }

    // Reset button
    document.getElementById("reset-btn").addEventListener("click", () => {
      chrome.storage.sync.set(DEFAULT_SETTINGS, () => {
        for (const options of Object.values(SECTIONS)) {
          options.forEach(({ id }) => {
            const el = document.getElementById(id);
            if (el) el.checked = DEFAULT_SETTINGS[id];
          });
        }
        showStatus("Settings reset to defaults.");
      });
    });

    // Save button
    document.getElementById("save-btn").addEventListener("click", () => {
      const newSettings = {};
      for (const options of Object.values(SECTIONS)) {
        options.forEach(({ id }) => {
          const el = document.getElementById(id);
          if (el) newSettings[id] = el.checked;
        });
      }
      chrome.storage.sync.set(newSettings, () => {
        if (chrome.runtime.lastError) {
          showStatus("Error saving: " + chrome.runtime.lastError.message, true);
        } else {
          showStatus("Settings saved successfully.");
        }
      });
    });
  });
});
