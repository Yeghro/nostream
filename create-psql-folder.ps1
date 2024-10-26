# Create necessary directories for Nostr
$projectRoot = Get-Location
$nostrDir = Join-Path $projectRoot ".nostr"
$dataDir = Join-Path $nostrDir "data"
$dbLogsDir = Join-Path $nostrDir "db-logs"

# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path $nostrDir
New-Item -ItemType Directory -Force -Path $dataDir
New-Item -ItemType Directory -Force -Path $dbLogsDir

Write-Host "Directories created successfully:"
Write-Host "Nostr directory: $nostrDir"
Write-Host "Data directory: $dataDir"
Write-Host "DB logs directory: $dbLogsDir"