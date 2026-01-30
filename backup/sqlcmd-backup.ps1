# set-executionpolicy remotesigned
# https://superuser.com/questions/106360/how-to-enable-execution-of-powershell-scripts
# Define variables
$serverName = "YourServerName"
$databaseName = "YourDatabaseName"
$backupFilePath = "C:\Path\To\Backup\YourDatabaseName.bak"
$sqlcmdPath = "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"

# Function to add sqlcmd path to system PATH if not already present
function Add-SqlcmdToPath {
    param (
        [string]$sqlcmdPath
    )

    # Get the current system PATH
    $currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

    # Check if the sqlcmd path is already in the system PATH
    if ($currentPath -notlike "*$($sqlcmdPath -replace '\\sqlcmd.exe', '')*") {
        # Add the sqlcmd path to the system PATH
        $newPath = $currentPath + ";" + $($sqlcmdPath -replace '\\sqlcmd.exe', '')
        [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
        Write-Output "sqlcmd path added to system PATH."
    } else {
        Write-Output "sqlcmd path is already in the system PATH."
    }
}

# Add sqlcmd to the system PATH if not already present
Add-SqlcmdToPath -sqlcmdPath $sqlcmdPath

# Construct the sqlcmd command
$sqlcmdCommand = "sqlcmd -S $serverName -Q `"BACKUP DATABASE [$databaseName] TO DISK = N'$backupFilePath' WITH NOFORMAT, NOINIT, NAME = N'$databaseName-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10`""

# Execute the sqlcmd command
Invoke-Expression $sqlcmdCommand

# Check if the backup was successful
if (Test-Path $backupFilePath) {
    Write-Output "Backup successful. File path: $backupFilePath"
} else {
    Write-Output "Backup failed."
}
