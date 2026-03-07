<#
.SYNOPSIS
    Automatically updates version numbers across all project files.

.DESCRIPTION
    This script updates version numbers in:
    - disable-yt-hotkeys.user.js (Userscript @version tag)
    - MANIFEST.json (version field)
    - README.md (version badge)
    - CHANGELOG.md (adds new version entry)
    - src/manifests/manifest.chrome.json (extension version)
    - src/manifests/manifest.firefox.json (extension version)

.PARAMETER NewVersion
    The new version number (e.g., "4.4", "5.0")

.PARAMETER Type
    Bump type: major, minor, or patch. If specified, automatically increments current version.

.EXAMPLE
    .\scripts\Update-Version.ps1 -NewVersion "4.4"

.EXAMPLE
    .\scripts\Update-Version.ps1 -Type patch
#>

[CmdletBinding(DefaultParameterSetName = 'Manual')]
param(
    [Parameter(ParameterSetName = 'Manual', Mandatory = $true)]
    [string]$NewVersion,

    [Parameter(ParameterSetName = 'Auto', Mandatory = $true)]
    [ValidateSet('major', 'minor', 'patch')]
    [string]$Type
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Get project root
$ProjectRoot = Split-Path -Parent $PSScriptRoot

# File paths
$UserScriptPath = Join-Path $ProjectRoot 'disable-yt-hotkeys.user.js'
$ManifestPath = Join-Path $ProjectRoot 'MANIFEST.json'
$ReadmePath = Join-Path $ProjectRoot 'README.md'
$ChangelogPath = Join-Path $ProjectRoot 'CHANGELOG.md'
$ChromeManifestPath = Join-Path $ProjectRoot 'src\manifests\manifest.chrome.json'
$FirefoxManifestPath = Join-Path $ProjectRoot 'src\manifests\manifest.firefox.json'

function Get-CurrentVersion {
    Write-Host "`n[*] Reading current version..." -ForegroundColor Cyan

    $userScriptContent = Get-Content $UserScriptPath -Raw
    if ($userScriptContent -match '@version\s+(\d+\.\d+(?:\.\d+)?)') {
        $currentVersion = $Matches[1]
        Write-Host "   Current version: $currentVersion" -ForegroundColor Yellow
        return $currentVersion
    }
    throw "Could not find current version in userscript"
}

function Get-NextVersion {
    param([string]$CurrentVersion, [string]$BumpType)

    $parts = $CurrentVersion -split '\.'

    switch ($BumpType) {
        'major' {
            $major = [int]$parts[0] + 1
            return "$major.0"
        }
        'minor' {
            $major = [int]$parts[0]
            $minor = [int]$parts[1] + 1
            return "$major.$minor"
        }
        'patch' {
            if ($parts.Count -eq 2) {
                return "$($parts[0]).$($parts[1]).1"
            }
            $major = [int]$parts[0]
            $minor = [int]$parts[1]
            $patch = [int]$parts[2] + 1
            return "$major.$minor.$patch"
        }
    }
}

# Determine version to use
if ($PSCmdlet.ParameterSetName -eq 'Auto') {
    $currentVer = Get-CurrentVersion
    $NewVersion = Get-NextVersion -CurrentVersion $currentVer -BumpType $Type
    Write-Host "   Auto-bumping ($Type): $currentVer -> $NewVersion" -ForegroundColor Green
}

Write-Host "`n[*] Updating to version: $NewVersion" -ForegroundColor Green

# Validation
if ($NewVersion -notmatch '^\d+\.\d+(?:\.\d+)?$') {
    throw "Invalid version format. Use format: X.Y or X.Y.Z"
}

# Update Userscript
Write-Host "`n[1] Updating userscript..." -ForegroundColor Cyan
$userScriptContent = Get-Content $UserScriptPath -Raw
$userScriptContent = $userScriptContent -replace '@version\s+\d+\.\d+(?:\.\d+)?', "@version      $NewVersion"
Set-Content -Path $UserScriptPath -Value $userScriptContent -NoNewline
Write-Host "   [OK] Updated disable-yt-hotkeys.user.js" -ForegroundColor Green

# Update MANIFEST.json
Write-Host "`n[2] Updating MANIFEST.json..." -ForegroundColor Cyan
$manifestContent = Get-Content $ManifestPath -Raw | ConvertFrom-Json
$manifestContent.version = $NewVersion
$manifestContent | ConvertTo-Json -Depth 100 | Set-Content -Path $ManifestPath
Write-Host "   [OK] Updated MANIFEST.json" -ForegroundColor Green

# Update README.md
Write-Host "`n[3] Updating README.md..." -ForegroundColor Cyan
$readmeContent = Get-Content $ReadmePath -Raw
$readmeContent = $readmeContent -replace 'version-\d+\.\d+(?:\.\d+)?-', "version-$NewVersion-"
Set-Content -Path $ReadmePath -Value $readmeContent -NoNewline
Write-Host "   [OK] Updated README.md" -ForegroundColor Green

# Update Chrome extension manifest
Write-Host "`n[4] Updating src/manifests/manifest.chrome.json..." -ForegroundColor Cyan
if (Test-Path $ChromeManifestPath) {
    $chromeManifest = Get-Content $ChromeManifestPath -Raw | ConvertFrom-Json
    $chromeManifest.version = $NewVersion
    $chromeManifest | ConvertTo-Json -Depth 100 | Set-Content -Path $ChromeManifestPath
    Write-Host "   [OK] Updated manifest.chrome.json" -ForegroundColor Green
}
else {
    Write-Host "   [SKIP] src/manifests/manifest.chrome.json not found (skipping)" -ForegroundColor Gray
}

# Update Firefox extension manifest
Write-Host "`n[5] Updating src/manifests/manifest.firefox.json..." -ForegroundColor Cyan
if (Test-Path $FirefoxManifestPath) {
    $firefoxManifest = Get-Content $FirefoxManifestPath -Raw | ConvertFrom-Json
    $firefoxManifest.version = $NewVersion
    $firefoxManifest | ConvertTo-Json -Depth 100 | Set-Content -Path $FirefoxManifestPath
    Write-Host "   [OK] Updated manifest.firefox.json" -ForegroundColor Green
}
else {
    Write-Host "   [SKIP] src/manifests/manifest.firefox.json not found (skipping)" -ForegroundColor Gray
}

# Update CHANGELOG.md (add placeholder for new version)
Write-Host "`n[6] Updating CHANGELOG.md..." -ForegroundColor Cyan
$changelogContent = Get-Content $ChangelogPath -Raw
$today = Get-Date -Format 'yyyy-MM-dd'

# Check if version already exists
if ($changelogContent -notmatch "\[$NewVersion\]") {
    # Create the new entry
    $newEntry = "`n`n## [$NewVersion] - $today`n`n"
    $newEntry += "### Added`n"
    $newEntry += "- [Timing Fix] Improved button injection reliability on first page load`n"
    $newEntry += "- [Events] Added proper YouTube SPA navigation event listeners`n"
    $newEntry += "- [Retry Logic] Implemented exponential backoff for DOM element detection`n`n"
    $newEntry += "### Changed`n"
    $newEntry += "- Enhanced initialization logic to wait for specific DOM elements`n"
    $newEntry += "- Better handling of YouTube's dynamic content loading`n`n"
    $newEntry += "### Fixed`n"
    $newEntry += "- Fixed race condition causing button to not appear on first video load`n"
    $newEntry += "- Improved compatibility with YouTube's updated UI structure`n`n"

    # Insert after "## [Unreleased]" or before the first version
    if ($changelogContent -match '##\s+\[Unreleased\]') {
        $changelogContent = $changelogContent -replace '(##\s+\[Unreleased\][^\n]*\n)', "`$1$newEntry"
    }
    else {
        # Insert before first version entry
        $changelogContent = $changelogContent -replace '(##\s+\[\d+\.\d+)', "$newEntry`$1"
    }

    Set-Content -Path $ChangelogPath -Value $changelogContent -NoNewline
    Write-Host "   [OK] Added new version entry to CHANGELOG.md" -ForegroundColor Green
}
else {
    Write-Host "   [WARN] Version $NewVersion already exists in CHANGELOG.md" -ForegroundColor Yellow
}

# Summary
Write-Host ""
Write-Host "=====================================================" -ForegroundColor Magenta
Write-Host "  [DONE] Version Update Complete!                   " -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Magenta
Write-Host "`nUpdated Files:" -ForegroundColor Cyan
Write-Host "  - disable-yt-hotkeys.user.js" -ForegroundColor White
Write-Host "  - MANIFEST.json" -ForegroundColor White
Write-Host "  - README.md" -ForegroundColor White
Write-Host "  - CHANGELOG.md" -ForegroundColor White
Write-Host "  - src/manifests/manifest.chrome.json" -ForegroundColor White
Write-Host "  - src/manifests/manifest.firefox.json" -ForegroundColor White

Write-Host "`n[*] Next Steps:" -ForegroundColor Cyan
Write-Host "  1. Review CHANGELOG.md and update the entries" -ForegroundColor White
Write-Host "  2. Test the userscript" -ForegroundColor White
Write-Host "  3. Commit changes:" -ForegroundColor White
Write-Host "     git add ." -ForegroundColor Gray
Write-Host "     git commit -m `"chore: bump version to $NewVersion`"" -ForegroundColor Gray
Write-Host "  4. Create tag: git tag v$NewVersion" -ForegroundColor White
Write-Host "  5. Push changes:" -ForegroundColor White
Write-Host "     git push" -ForegroundColor Gray