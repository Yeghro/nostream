# Windows PowerShell script for starting Nostream

$PROJECT_ROOT = Split-Path -Parent $PSScriptRoot
$DOCKER_COMPOSE_FILE = Join-Path $PROJECT_ROOT "docker-compose.yml"
$NOSTR_CONFIG_DIR = Join-Path $PROJECT_ROOT ".nostr"
$SETTINGS_FILE = Join-Path $NOSTR_CONFIG_DIR "settings.yaml"
$DEFAULT_SETTINGS_FILE = Join-Path $PROJECT_ROOT "resources\default-settings.yaml"
$CURRENT_DIR = Get-Location

if ($CURRENT_DIR -like "*\scripts") {
    Write-Host "Please run this script from the Nostream root folder, not the scripts directory."
    Write-Host "To do this, change up one directory, and then run the following command:"
    Write-Host ".\scripts\start.ps1"
    exit 1
}

# Check if running as administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Error: Nostream should not be run as administrator."
    exit 1
}

if (-not (Test-Path $NOSTR_CONFIG_DIR)) {
    Write-Host "Creating folder $NOSTR_CONFIG_DIR"
    New-Item -ItemType Directory -Path $NOSTR_CONFIG_DIR | Out-Null
}

if (-not (Test-Path $SETTINGS_FILE)) {
    Write-Host "Copying $DEFAULT_SETTINGS_FILE to $SETTINGS_FILE"
    Copy-Item $DEFAULT_SETTINGS_FILE $SETTINGS_FILE
}

# Run docker-compose
docker-compose -f $DOCKER_COMPOSE_FILE up --build --remove-orphans $args