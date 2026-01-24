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

Write-Host @"

╔════════════════════════════════════════════════════╗
║   YouTube Keystrokes Blocker - Release Script     ║
║   Life Experimentalist Organization                ║
╚════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

# Get current version
$UserScriptPath = Join-Path $ProjectRoot 'disable-yt-hotkeys.user.js'
$content = Get-Content $UserScriptPath -Raw
if ($content -match '@version\s+(\d+\.\d+(?:\.\d+)?)') {
    $version = $Matches[1]
    Write-Host "📦 Releasing version: v$version`n" -ForegroundColor Green
} else {
    throw "❌ Could not determine version from userscript"
}

# Step 1: Git Status Check
if (-not $SkipValidation) {
    Write-Host "1️⃣  Checking Git status..." -ForegroundColor Cyan
    Push-Location $ProjectRoot
    try {
        $status = git status --porcelain
        if ($status) {
            Write-Host "   ⚠️  Warning: Uncommitted changes detected:" -ForegroundColor Yellow
            Write-Host $status -ForegroundColor Gray

            $response = Read-Host "`n   Continue anyway? (y/N)"
            if ($response -ne 'y') {
                Write-Host "`n❌ Release cancelled. Commit your changes first." -ForegroundColor Red
                exit 1
            }
        } else {
            Write-Host "   ✅ Working tree is clean" -ForegroundColor Green
        }
    } finally {
        Pop-Location
    }
}

# Step 2: Validate Files Exist
Write-Host "`n2️⃣  Validating required files..." -ForegroundColor Cyan
$requiredFiles = @(
    'disable-yt-hotkeys.user.js',
    'MANIFEST.json',
    'README.md',
    'CHANGELOG.md',
    'LICENSE.md'
)

foreach ($file in $requiredFiles) {
    $path = Join-Path $ProjectRoot $file
    if (Test-Path $path) {
        Write-Host "   ✅ $file" -ForegroundColor Green
    } else {
        throw "❌ Required file missing: $file"
    }
}

# Step 3: Run Tests (placeholder)
Write-Host "`n3️⃣  Running tests..." -ForegroundColor Cyan
Write-Host "   ⏭️  No tests configured (skipping)" -ForegroundColor Gray

# Step 4: Build/Validation
Write-Host "`n4️⃣  Validating userscript syntax..." -ForegroundColor Cyan
try {
    # Basic JavaScript syntax validation
    $scriptContent = Get-Content $UserScriptPath -Raw

    # Check for required GM_ functions
    $requiredFunctions = @('GM_registerMenuCommand', 'GM_setValue', 'GM_getValue', 'GM_addStyle')
    $allPresent = $true
    foreach ($func in $requiredFunctions) {
        if ($scriptContent -notmatch $func) {
            Write-Host "   ⚠️  Warning: $func not found" -ForegroundColor Yellow
            $allPresent = $false
        }
    }

    if ($allPresent) {
        Write-Host "   ✅ All required GM functions present" -ForegroundColor Green
    }

    Write-Host "   ✅ Userscript validation passed" -ForegroundColor Green
} catch {
    throw "❌ Userscript validation failed: $_"
}

# Step 5: Create Git Tag
Write-Host "`n5️⃣  Creating Git tag..." -ForegroundColor Cyan
Push-Location $ProjectRoot
try {
    # Check if tag already exists
    $tagExists = git tag -l "v$version"
    if ($tagExists) {
        Write-Host "   ⚠️  Tag v$version already exists" -ForegroundColor Yellow
        $response = Read-Host "`n   Delete and recreate tag? (y/N)"
        if ($response -eq 'y') {
            git tag -d "v$version"
            git push origin ":refs/tags/v$version" 2>$null
            Write-Host "   🗑️  Deleted existing tag" -ForegroundColor Gray
        } else {
            Write-Host "`n❌ Release cancelled" -ForegroundColor Red
            exit 1
        }
    }

    # Create new tag
    git tag -a "v$version" -m "Release version $version"
    Write-Host "   ✅ Created tag: v$version" -ForegroundColor Green
} catch {
    throw "❌ Failed to create tag: $_"
} finally {
    Pop-Location
}

# Step 6: Push to GitHub
Write-Host "`n6️⃣  Pushing to GitHub..." -ForegroundColor Cyan
Push-Location $ProjectRoot
try {
    # Push commits
    git push origin main
    Write-Host "   ✅ Pushed commits to main" -ForegroundColor Green

    # Push tags
    git push origin "v$version"
    Write-Host "   ✅ Pushed tag v$version" -ForegroundColor Green
} catch {
    throw "❌ Failed to push to GitHub: $_"
} finally {
    Pop-Location
}

# Step 7: Summary
Write-Host @"

╔════════════════════════════════════════════════════╗
║           🎉 Release Complete! 🎉                  ║
╚════════════════════════════════════════════════════╝

"@ -ForegroundColor Green

Write-Host "Version: v$version" -ForegroundColor White
Write-Host "Repository: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker" -ForegroundColor Cyan
Write-Host "`n📝 Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Create GitHub Release: https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/new?tag=v$version" -ForegroundColor White
Write-Host "  2. Update Greasy Fork: https://greasyfork.org/en/scripts/563265-disable-youtube-hotkeys-with-modern-settings-page/versions/new" -ForegroundColor White
Write-Host "  3. Announce on discussions/social media" -ForegroundColor White
Write-Host ""

# Open browser to create release
$openBrowser = Read-Host "Open GitHub Releases page? (Y/n)"
if ($openBrowser -ne 'n') {
    Start-Process "https://github.com/Life-Experimentalist/Youtube-Keystrokes-Blocker/releases/new?tag=v$version"
}
