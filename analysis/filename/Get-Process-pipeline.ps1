   #src=&quot;https://gist.github.com/jahio/516433589236766a1d5873598bd4f8a

   #!/usr/bin/env pwsh
   # Uses Get-Process piped to some stuff to get a list of processes
   # over a certain amount of memory and output those as JSON.
   # Takes no arguments.
   # NOTE: This threshold is defined as BYTES, not KILOBYTES like the
   # shell script.
   # Adjust the math accordingly.
   $threshold = (200 * 1024) * 1024 # Don't report anything greater than
   200MB
   $procs = Get-Process | Where-Object { $_.WorkingSet64 -gt $threshold }
   $procs | Select-Object -Property CommandLine,WorkingSet64,Id |
   ConvertTo-Json
   # We can do this with PowerShell without tainting output redirection to file;
   # not so with bash|zsh! Set $VerbosePreference = 'Continue' to see this.
   Write-Verbose "Found $($procs.Count) processes exceeding threshold"
   Write-Verbose "Threshold: $($threshold / 1024 / 1024)MB"
   # Compare how smooth and easy this is with the shell script equivalent:
   # https://gist.github.com/jahio/5eaacad1c23a00f96137fd13cf3a7b16
   #
   # I know which one I'd rather work with!

#   © 2024 GitHub, Inc.
