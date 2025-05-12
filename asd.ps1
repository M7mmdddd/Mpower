# Define the content to write
$content = "Hello"

# Get the path to the desktop
$desktopPath = [Environment]::GetFolderPath("Desktop")

# Define the full file path
$filePath = Join-Path -Path $desktopPath -ChildPath "hello.txt"

# Write the content to the file
$content | Out-File -FilePath $filePath -Force

# Display confirmation message
Write-Host "The file has been saved to: $filePath"