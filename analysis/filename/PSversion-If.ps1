# check PS version
Get-Host
# if syntax example
$Calendar = Get-Date
If ($Calendar.Month -eq '8') {"This month is August."}
Else {"Not August."}
Get-Variable
if ($psedition -eq 'core') {'the edition is core.'}
# full history check
Get-Content (Get-PSReadLineOption).HistorySavePath
# MD5 hash. Everything is an object in powershell. (Aug 23, 2024)
Get-FileHash ./yourfile -Algorithm MD5
