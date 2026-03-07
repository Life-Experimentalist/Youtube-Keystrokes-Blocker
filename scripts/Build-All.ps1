<#
.SYNOPSIS
    Builds all YouTube Keystrokes Blocker release artifacts (Chrome, Firefox, Userscript).

.DESCRIPTION
    This script:
    1. Builds the Chrome/Edge extension -> release/*.zip
    2. Builds the Firefox extension    -> release/*.zip
    3. Copies the userscript           -> release/*.user.js

.PARAMETER OutputDir
    Output directory for release artifacts. Defaults to 'release' (project root).

.EXAMPLE
    .\scripts\Build-All.ps1
#>

[CmdletBinding()]
param(
    [string]$OutputDir = ''
)

# Resolve the directory containing this script BEFORE enabling strict mode
# (so $PSScriptRoot comparison doesn't trigger strict mode errors in some hosts)
$ScriptDir = $PSScriptRoot
if ([string]::IsNullOrEmpty($ScriptDir)) {
    $ScriptDir = Split-Path -Absolute $MyInvocation.MyCommand.Path
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $ScriptDir

if ($OutputDir -eq '') {
    $OutputDir = Join-Path $ProjectRoot 'release'
}

# Ensure release dir exists
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  YouTube Keystrokes Blocker - Build All            " -ForegroundColor Cyan
Write-Host "  Life Experimentalist Organization                 " -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# --- Get version ---
$chromeManifest = Join-Path $ProjectRoot 'src\manifests\manifest.chrome.json'
$manifestJson   = Get-Content $chromeManifest -Raw | ConvertFrom-Json
$Version        = $manifestJson.version

Write-Host "[*] Version: v$Version" -ForegroundColor Yellow
Write-Host ""

# --- Build extensions ---
$buildScript = Join-Path $ScriptDir 'Build-Extension.ps1'

Write-Host "[1] Building Chrome/Edge extension..." -ForegroundColor Cyan
& $buildScript -Browser chrome -OutputDir $OutputDir

Write-Host "[2] Building Firefox extension..." -ForegroundColor Cyan
& $buildScript -Browser firefox -OutputDir $OutputDir

# --- Copy userscript ---
Write-Host "[3] Copying userscript artifact..." -ForegroundColor Cyan
$userscriptSrc  = Join-Path $ProjectRoot 'disable-yt-hotkeys.user.js'
$userscriptDest = Join-Path $OutputDir   "youtube-hotkeys-blocker-v${Version}-userscript.user.js"
Copy-Item $userscriptSrc $userscriptDest -Force
Write-Host "   [OK] Copied: release\youtube-hotkeys-blocker-v${Version}-userscript.user.js" -ForegroundColor Green

# --- Summary ---
Write-Host ""
Write-Host "=====================================================" -ForegroundColor Green
Write-Host "  [OK] All Artifacts Built!                         " -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Green

Write-Host "`nRelease artifacts in: $OutputDir" -ForegroundColor Cyan
Get-ChildItem $OutputDir | Where-Object { $_.Extension -match '\.(zip|js)$' } | ForEach-Object {
    $sz = [math]::Round($_.Length / 1KB, 1)
    Write-Host "   $($_.Name)  ($sz KB)" -ForegroundColor White
}
Write-Host ""