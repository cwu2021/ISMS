## write me an xml checker with powershell
## https://duckduckgo.com/?q=DuckDuckGo+AI+Chat&ia=chat&duckai=1
# the script should be saved in ANSI instead of UTF-8.

# Function to check if an XML file is well-formed
function Test-Xml {
    param (
        [string]$FilePath
    )

    # Check if the file exists
    if (-Not (Test-Path $FilePath)) {
        Write-Host "File not found: $FilePath"
        return $false
    }

    try {
        # Load the XML file
        [xml]$xml = Get-Content $FilePath -ErrorAction Stop
        Write-Host "The XML file is well-formed."
        return $true
    } catch {
        Write-Host "The XML file is not well-formed."
        Write-Host "Error: $_"
        return $false
    }
}

# Example usage
#$xmlFilePath = 'C:\Users\myuser\Desktop\TEST\20240914.XML'
$xmlFilePath = '20240906.XML'
Test-Xml -FilePath $xmlFilePath
