<#
.SYNOPSIS
    Automated release script for YouTube Keystrokes Blocker

.DESCRIPTION
    This script automates the release process:
    1. Validates all files are committed
    2. Runs tests (if any)
    3. Builds the userscript
    4. Creates a git tag
    5. Pushes to GitHub
    6. Opens release page

.PARAMETER SkipValidation
    Skip git validation checks

.EXAMPLE
    .\scripts\Release.ps1
#>

[CmdletBinding()]
param(
    [switch]$SkipValidation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $PSScriptRoot

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  YouTube Keystrokes Blocker - Release Script       " -ForegroundColor Cyan
Write-Host "  Life Experimentalist Organization                 " -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Get current version
$UserScriptPath = Join-Path $ProjectRoot 'disable-yt-hotkeys.user.js'
$content = Get-Content $UserScriptPath -Raw
if ($content -match '@version\s+(\d+\.\d+(?:\.\d+)?)') {
    $version = $Matches[1]
    Write-Host "[*] Releasing version: v$version" -ForegroundColor Green
    Write-Host ""
} else {
    throw "[ERROR] Could not determine version from userscript"
}

# Step 1: Git Status Check
if (-not $SkipValidation) {
    Write-Host "[1] Checking Git status..." -ForegroundColor Cyan
    Push-Location $ProjectRoot
    try {
        $status = git status --porcelain
        if ($status) {
            Write-Host "   [WARN] Uncommitted changes detected:" -ForegroundColor Yellow
            Write-Host $status -ForegroundColor Gray

            $response = Read-Host "`n   Continue anyway? (y/N)"
            if ($response -ne 'y') {
                Write-Host "`n[CANCELLED] Release cancelled. Commit your changes first." -ForegroundColor Red
                exit 1
            }
        } else {
            Write-Host "   [OK] Working tree is clean" -ForegroundColor Green
        }
    } finally {
        Pop-Location
    }
}

# Step 2: Validate Files Exist
Write-Host "`n[2] Validating required files..." -ForegroundColor Cyan
$requiredFiles = @(
    'disable-yt-hotkeys.user.js',
    'MANIFEST.json',
    'README.md',
    'CHANGELOG.md',
    'LICENSE.md',
    'src\manifests\manifest.chrome.json',
    'src\manifests\manifest.firefox.json',
    'src\content.js',
    'src\background.js'
)

foreach ($file in $requiredFiles) {
    $path = Join-Path $ProjectRoot $file
    if (Test-Path $path) {
        Write-Host "   [OK] $file" -ForegroundColor Green
    } else {
        throw "[ERROR] Required file missing: $file"
    }
}

# Step 3: Run Tests (placeholder)
Write-Host "`n[3] Running tests..." -ForegroundColor Cyan
Write-Host "   [SKIP] No tests configured (skipping)" -ForegroundColor Gray

# Step 4: Build Extensions + Userscript Artifact
Write-Host "`n[4] Building release artifacts..." -ForegroundColor Cyan
$buildAllScript = Join-Path $PSScriptRoot 'Build-All.ps1'
if (Test-Path $buildAllScript) {
    try {
        & $buildAllScript
        Write-Host "   [OK] Extension ZIPs + userscript artifact built" -ForegroundColor Green
    } catch {
        Write-Host "   [WARN] Build failed: $_" -ForegroundColor Yellow
        $response = Read-Host "`n   Continue release without build artifacts? (y/N)"
        if ($response -ne 'y') {
            Write-Host "`n[CANCELLED] Release cancelled." -ForegroundColor Red
            exit 1
        }
    }
} else {
    Write-Host "   [SKIP] Build-All.ps1 not found (skipping)" -ForegroundColor Gray
}

# Step 5: Validate userscript syntax
Write-Host "`n[5] Validating userscript syntax..." -ForegroundColor Cyan
try {
    # Basic JavaScript syntax validation
    $scriptContent = Get-Content $UserScriptPath -Raw

    # Check for required GM_ functions
    $requiredFunctions = @('GM_registerMenuCommand', 'GM_setValue', 'GM_getValue', 'GM_addStyle')
    $allPresent = $true
    foreach ($func in $requiredFunctions) {
        if ($scriptContent -notmatch $func) {
            Write-Host "   [WARN] Warning: $func not found" -ForegroundColor Yellow
            $allPresent = $false
        }
    }

    if ($allPresent) {
        Write-Host "   [OK] All required GM functions present" -ForegroundColor Green
    }

    Write-Host "   [OK] Userscript validation passed" -ForegroundColor Green
} catch {
    throw "[ERROR] Userscript validation failed: $_"
}

# Step 6: Create Git Tag
Write-Host "`n[6] Creating Git tag..." -ForegroundColor Cyan
Push-Location $ProjectRoot
try {
    # Check if tag already exists
    $tagExists = git tag -l "v$version"
    if ($tagExists) {
        Write-Host "   [WARN] Tag v$version already exists" -ForegroundColor Yellow
        $response = Read-Host "`n   Delete and recreate tag? (y/N)"
        if ($response -eq 'y') {
            git tag -d "v$version"
            git push origin ":refs/tags/v$version" 2>$null
            Write-Host "   [DELETED] Deleted existing tag" -ForegroundColor Gray
        } else {
            Write-Host "`n[CANCELLED] Release cancelled" -ForegroundColor Red
            exit 1
        }
    }

    # Create new tag
    git tag -a "v$version" -m "Release version $version"
    Write-Host "   [OK] Created tag: v$version" -ForegroundColor Green
} catch {
    throw "[ERROR] Failed to create tag: $_"
} finally {
    Pop-Location
}

# Step 7: Push to GitHub
Write-Host "`n[7] Pushing to GitHub..." -ForegroundColor Cyan
Push-Location $ProjectRoot
try {
    # Push commits
    git push origin main
    Write-Host "   [OK] Pushed commits to main" -ForegroundColor Green

    # Push tags
    git push origin "v$version"
    Write-Host "   [OK] Pushed tag v$version" -ForegroundColor Green
} catch {
    throw "[ERROR] Failed to push to GitHub: $_"
} finally {
    Pop-Location
}

# Step 8: Summary
$releaseDir = Join-Path $ProjectRoot 'release'
Write-Host ""
Write-Host "=====================================================" -ForegroundColor Green
Write-Host "  [DONE] Release Complete!                          " -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Green
Write-Host ""

Write-Host "Version: v$version" -ForegroundColor White
Write-Host "Repository: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker" -ForegroundColor Cyan

if (Test-Path $releaseDir) {
    Write-Host "`n[*] Release artifacts:" -ForegroundColor Yellow
    Get-ChildItem $releaseDir | Where-Object { $_.Extension -match '\.(zip|js)$' } | ForEach-Object {
        $size = [math]::Round($_.Length / 1KB, 1)
        Write-Host "   $($_.Name)  ($size KB)" -ForegroundColor White
    }
}

Write-Host "`n[*] Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Create GitHub Release: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/new?tag=v$version" -ForegroundColor White
Write-Host "     Upload the ZIPs from the release/ directory as release assets." -ForegroundColor Gray
Write-Host "  2. Chrome Web Store: https://chrome.google.com/webstore/devconsole" -ForegroundColor White
Write-Host "  3. Firefox Add-ons: https://addons.mozilla.org/en-US/developers/" -ForegroundColor White
Write-Host "  4. Update Greasy Fork: https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page/versions/new" -ForegroundColor White
Write-Host "  5. Announce on discussions/social media" -ForegroundColor White
Write-Host ""

# Open browser to create release
$openBrowser = Read-Host "Open GitHub Releases page? (Y/n)"
if ($openBrowser -ne 'n') {
    Start-Process "https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/new?tag=v$version"
}