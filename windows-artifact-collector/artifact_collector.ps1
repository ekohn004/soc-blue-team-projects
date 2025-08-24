# artifact_collector.ps1
# A basic Windows Incident Response artifact collector

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$destination = "C:\IR_Artifacts_$timestamp"
New-Item -ItemType Directory -Path $destination -Force | Out-Null

# Export Windows Event Logs
$logs = @("System", "Security", "Application")
foreach ($log in $logs) {
    wevtutil epl $log "$destination\$log.evtx"
}

# Get running processes
Get-Process | Sort-Object CPU -Descending | Out-File "$destination\running_processes.txt"

# Get network connections
netstat -ano | Out-File "$destination\netstat.txt"

# Get autoruns (requires autoruns utility in path)
if (Get-Command autorunsc -ErrorAction SilentlyContinue) {
    autorunsc -accepteula -a * > "$destination\autoruns.txt"
} else {
    Write-Warning "Autorunsc not found in PATH. Skipping autoruns collection."
}

# Get recent logins
Get-CimInstance -ClassName Win32_LoggedOnUser | Out-File "$destination\logged_on_users.txt"

# Get scheduled tasks
Get-ScheduledTask | Out-File "$destination\scheduled_tasks.txt"

# Compress everything
$zipPath = "$env:USERPROFILE\Desktop\IR_Artifacts_$timestamp.zip"
Compress-Archive -Path $destination -DestinationPath $zipPath

Write-Host "`nArtifacts collected and saved to $zipPath"