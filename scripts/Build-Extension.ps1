<#
.SYNOPSIS
    Builds the YouTube Keystrokes Blocker browser extension for Chrome/Edge and/or Firefox.

.DESCRIPTION
    This script:
    1. Reads the version from src/manifests/manifest.chrome.json
    2. Generates icon PNGs (16, 48, 128 px) from the SVG path using System.Drawing
    3. Stages extension files in a temp build directory
    4. Creates browser-specific manifest.json
    5. Zips the build directory into release/<browser>-<version>.zip

.PARAMETER Browser
    Which browser to build for: 'chrome', 'firefox', or 'all'.
    Defaults to 'all'.

.PARAMETER OutputDir
    Output directory for release artifacts. Defaults to 'release' (project root).

.EXAMPLE
    .\scripts\Build-Extension.ps1 -Browser all
    .\scripts\Build-Extension.ps1 -Browser chrome
#>

[CmdletBinding()]
param(
    [ValidateSet('chrome', 'firefox', 'all')]
    [string]$Browser = 'all',

    [string]$OutputDir = ''
)

# Resolve the directory containing this script BEFORE enabling strict mode
$ScriptDir = $PSScriptRoot
if ([string]::IsNullOrEmpty($ScriptDir)) {
    $ScriptDir = Split-Path -Absolute $MyInvocation.MyCommand.Path
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $ScriptDir
$SrcDir = Join-Path $ProjectRoot 'src'
$ManifestsDir = Join-Path $SrcDir 'manifests'

if ($OutputDir -eq '') {
    $OutputDir = Join-Path $ProjectRoot 'release'
}

# Ensure release dir exists
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

# ---------------------------------------------------------------------------
# Read version from Chrome manifest (source of truth)
# ---------------------------------------------------------------------------
$chromeManifestPath = Join-Path $ManifestsDir 'manifest.chrome.json'
$manifestJson = Get-Content $chromeManifestPath -Raw | ConvertFrom-Json
$Version = $manifestJson.version
Write-Host "`n[*] Building version: v$Version" -ForegroundColor Cyan

# ---------------------------------------------------------------------------
# Generate content.js by prepending GM API shims to the userscript core
# ---------------------------------------------------------------------------
Write-Host "[*] Generating content.js from gm-shims.js + userscript core..." -ForegroundColor Cyan

$shimPath = Join-Path $SrcDir 'gm-shims.js'
$scriptPath = Join-Path $ProjectRoot 'disable-yt-hotkeys.user.js'
$shims = [System.IO.File]::ReadAllText($shimPath, [System.Text.Encoding]::UTF8)
$rawScript = [System.IO.File]::ReadAllText($scriptPath, [System.Text.Encoding]::UTF8)

# Normalize line endings
$rawScript = $rawScript.Replace("`r`n", "`n").Replace("`r", "`n")

# Extract body: everything after the IIFE opening + "use strict" line
$iifeOpen = '(function () {' + "`n" + '  "use strict";' + "`n"
$openIdx = $rawScript.IndexOf($iifeOpen)
if ($openIdx -lt 0) { throw "Could not find IIFE opening in userscript. Check file format." }
$core = $rawScript.Substring($openIdx + $iifeOpen.Length)

# Strip the closing })(); from the end
$iifeClose = "`n" + '})();'
$closeIdx = $core.LastIndexOf($iifeClose)
if ($closeIdx -ge 0) { $core = $core.Substring(0, $closeIdx) }
$core = $core.TrimEnd()

# Assemble and write src/content.js (so unpacked extension stays in sync)
$contentJs = $shims + "`n  // === Userscript core (disable-yt-hotkeys.user.js) ===`n" + $core + "`n`n" + '})();'
[System.IO.File]::WriteAllText((Join-Path $SrcDir 'content.js'), $contentJs, [System.Text.Encoding]::UTF8)
Write-Host "   [OK] Generated src/content.js ($([int]($contentJs.Length / 1024)) KB)" -ForegroundColor Gray

# ---------------------------------------------------------------------------
# Generate icon PNGs using System.Drawing (matches icon.svg design)
# ---------------------------------------------------------------------------
function New-IconPng {
    param([string]$OutPath, [int]$Size)

    Add-Type -AssemblyName System.Drawing

    $scale = [double]$Size / 24.0
    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.Clear([System.Drawing.Color]::Transparent)

    $red = [System.Drawing.Color]::FromArgb(255, 255, 0, 51)
    $redBrush = New-Object System.Drawing.SolidBrush($red)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)

    # 1. Red rounded-rect background  (SVG: <rect rx="4" fill="#FF0033" />)
    $bgArcD = [Math]::Max(2, [int]([Math]::Round(4 * $scale)) * 2)
    $bgPath = New-Object System.Drawing.Drawing2D.GraphicsPath
    $bgPath.AddArc(0, 0, $bgArcD, $bgArcD, 180, 90)
    $bgPath.AddArc($Size - $bgArcD, 0, $bgArcD, $bgArcD, 270, 90)
    $bgPath.AddArc($Size - $bgArcD, $Size - $bgArcD, $bgArcD, $bgArcD, 0, 90)
    $bgPath.AddArc(0, $Size - $bgArcD, $bgArcD, $bgArcD, 90, 90)
    $bgPath.CloseFigure()
    $g.FillPath($redBrush, $bgPath)

    # 2. White keyboard body  (SVG path: (2,5) to (22,19) with small corner radius)
    $kbLeft = [int]([Math]::Round(2 * $scale))
    $kbTop = [int]([Math]::Round(5 * $scale))
    $kbRight = [int]([Math]::Round(22 * $scale))
    $kbBottom = [int]([Math]::Round(19 * $scale))
    $kbW = $kbRight - $kbLeft
    $kbH = $kbBottom - $kbTop
    $kbArcD = [Math]::Max(2, [int]([Math]::Round(1.5 * $scale)) * 2)
    $kbPath = New-Object System.Drawing.Drawing2D.GraphicsPath
    $kbPath.AddArc($kbLeft, $kbTop, $kbArcD, $kbArcD, 180, 90)
    $kbPath.AddArc($kbRight - $kbArcD, $kbTop, $kbArcD, $kbArcD, 270, 90)
    $kbPath.AddArc($kbRight - $kbArcD, $kbBottom - $kbArcD, $kbArcD, $kbArcD, 0, 90)
    $kbPath.AddArc($kbLeft, $kbBottom - $kbArcD, $kbArcD, $kbArcD, 90, 90)
    $kbPath.CloseFigure()
    $g.FillPath($whiteBrush, $kbPath)

    # 3. Red key tops — 5 keys per row at x=5,8,11,14,17; rows y=8 and y=11; size=2x2
    $keySize = [Math]::Max(1, [int]([Math]::Round(2 * $scale)))
    foreach ($rowY in @(8, 11)) {
        $ky = [int]([Math]::Round($rowY * $scale))
        foreach ($colX in @(5, 8, 11, 14, 17)) {
            $kx = [int]([Math]::Round($colX * $scale))
            $g.FillRectangle($redBrush, $kx, $ky, $keySize, $keySize)
        }
    }

    # 4. Spacebar  x=8..16 y=15..17
    $sbX = [int]([Math]::Round(8 * $scale))
    $sbY = [int]([Math]::Round(15 * $scale))
    $sbW = [int]([Math]::Round(8 * $scale))
    $sbH = [Math]::Max(1, [int]([Math]::Round(2 * $scale)))
    $g.FillRectangle($redBrush, $sbX, $sbY, $sbW, $sbH)

    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

# ---------------------------------------------------------------------------
# Build one browser package
# ---------------------------------------------------------------------------
function New-BrowserPackage {
    param(
        [string]$BrowserName,
        [string]$ManifestFile
    )

    Write-Host "`n[BUILD] Building: $BrowserName" -ForegroundColor Green

    $tempDir = Join-Path $ProjectRoot "build\$BrowserName"
    if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

    # --- Icons ---
    $iconsOut = Join-Path $tempDir 'icons'
    New-Item -ItemType Directory -Path $iconsOut -Force | Out-Null

    if ($BrowserName -eq 'firefox') {
        # Firefox supports SVG icons natively — copy the source SVG directly.
        $svgSrc = Join-Path $SrcDir 'icons\icon.svg'
        Copy-Item $svgSrc (Join-Path $iconsOut 'icon.svg')
        Write-Host "   Copying icon.svg (Firefox)..." -ForegroundColor Gray
    }
    else {
        # Chrome / Edge require rasterised PNGs.
        foreach ($size in @(16, 48, 128)) {
            $pngPath = Join-Path $iconsOut "icon$size.png"
            Write-Host "   Generating icon${size}.png..." -ForegroundColor Gray
            New-IconPng -OutPath $pngPath -Size $size
        }
    }

    # --- Manifest ---
    $srcManifest = Join-Path $ManifestsDir $ManifestFile
    Copy-Item $srcManifest (Join-Path $tempDir 'manifest.json')

    # --- Content script & CSS ---
    Copy-Item (Join-Path $SrcDir 'content.js')  (Join-Path $tempDir 'content.js')
    Copy-Item (Join-Path $SrcDir 'content.css') (Join-Path $tempDir 'content.css')

    # --- Background service worker ---
    Copy-Item (Join-Path $SrcDir 'background.js') (Join-Path $tempDir 'background.js')

    # --- Popup ---
    $popupOut = Join-Path $tempDir 'popup'
    New-Item -ItemType Directory -Path $popupOut -Force | Out-Null
    $popupSrc = Join-Path $SrcDir 'popup'
    Copy-Item (Join-Path $popupSrc 'popup.html') (Join-Path $popupOut 'popup.html')
    Copy-Item (Join-Path $popupSrc 'popup.js')   (Join-Path $popupOut 'popup.js')
    Copy-Item (Join-Path $popupSrc 'popup.css')  (Join-Path $popupOut 'popup.css')

    # --- Options page ---
    $optOut = Join-Path $tempDir 'options'
    New-Item -ItemType Directory -Path $optOut -Force | Out-Null
    $optSrc = Join-Path $SrcDir 'options'
    Copy-Item (Join-Path $optSrc 'options.html') (Join-Path $optOut 'options.html')
    Copy-Item (Join-Path $optSrc 'options.js')   (Join-Path $optOut 'options.js')
    Copy-Item (Join-Path $optSrc 'options.css')  (Join-Path $optOut 'options.css')

    # --- Zip ---
    $zipName = "youtube-hotkeys-blocker-v${Version}-${BrowserName}.zip"
    $zipPath = Join-Path $OutputDir $zipName

    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory($tempDir, $zipPath)

    Write-Host "   [OK] Created: release\$zipName" -ForegroundColor Green

    # Cleanup temp
    Remove-Item $tempDir -Recurse -Force
}

# ---------------------------------------------------------------------------
# Dispatch
# ---------------------------------------------------------------------------
switch ($Browser) {
    'chrome' { New-BrowserPackage -BrowserName 'chrome'  -ManifestFile 'manifest.chrome.json' }
    'firefox' { New-BrowserPackage -BrowserName 'firefox' -ManifestFile 'manifest.firefox.json' }
    'all' {
        New-BrowserPackage -BrowserName 'chrome'  -ManifestFile 'manifest.chrome.json'
        New-BrowserPackage -BrowserName 'firefox' -ManifestFile 'manifest.firefox.json'
    }
}

Write-Host "`n[DONE] Build complete. Artifacts in: $OutputDir`n" -ForegroundColor Cyan