# Define the registry paths asd
$avgExclusionsPath = "HKLM:\SOFTWARE\AVG\Antivirus\properties\Exclusions\Global" 

# Add a file or folder exclusion
$fileOrFolderPath = "C:\temp"
$exclusionName = "ExcludeFiles" # Unique name for the exclusion
New-ItemProperty -Path $avgExclusionsPath -Name $exclusionName -Value $fileOrFolderPath -PropertyType String -Force
