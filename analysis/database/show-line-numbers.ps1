# write code to show every line number of a text file in powershell
# https://duckduckgo.com/?q=DuckDuckGo+AI+Chat&ia=chat&duckai=1

function Show-LineNumbers {
    param (
        [string]$FilePath
    )

    if (-Not (Test-Path $FilePath)) {
        Write-Host "File not found: $FilePath" -ForegroundColor Red
        return
    }

    # Read the content of the file and enumerate lines
    $lines = Get-Content -Path $FilePath
    for ($i = 0; $i -lt $lines.Count; $i++) {
        Write-Host "$($i + 1): $($lines[$i])"
    }
}
# Example usage
# Show-LineNumbers -FilePath "C:\path\to\your\file.txt"
Show-LineNumbers -FilePath "20240906.XML"
