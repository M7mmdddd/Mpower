# Deny standard users access to disk management tools  
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Users","FullControl","Deny")  
$acl = Get-Acl "$env:windir\system32\format.com"  
$acl.AddAccessRule($rule)  
Set-Acl "$env:windir\system32\format.com" $acl  

# Also block diskmgmt.msc  
$acl = Get-Acl "$env:windir\system32\diskmgmt.msc"  
$acl.AddAccessRule($rule)  
Set-Acl "$env:windir\system32\diskmgmt.msc" $acl  
