$avgExclusionsPath = "HKLM:\SOFTWARE\AVG\Antivirus\Exclusions\Global"

# Add a file or folder exclusion
$fileOrFolderPath = "C:\temp"
$exclusionName = "ExcludeFiles" # Unique name for the exclusion
New-ItemProperty -Path $avgExclusionsPath -Name $exclusionName -Value $fileOrFolderPath -PropertyType String -Force
