# Path to avgctl.exe
$avgctlPath = "C:\Program Files\AVG\Antivirus\avgctl.exe"

# Add a file or folder to exclusions
& "$avgctlPath" /ADDPATH="C:\Path\To\FileOrFolder"

# Add a URL to exclusions
& "$avgctlPath" /ADDURL="http://example.com"
