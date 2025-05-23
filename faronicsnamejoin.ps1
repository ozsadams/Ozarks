#get serial
$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber

#set new name
$computer = "$SerialNumber"

#get credentials
$user = labdom\fddj
$pass = "<a>k@B7hK)5,ns}F"
$joincred = New-Object pscredential -argumentlist ([pscustomobject]@{
UserName = $user
Password = (ConvertTo-SecureString -String $pass -asplaintext -force)[0]
})

#join domain
Add-Computer -DomainName labdom.local -OUPath "OU=Staff-WSUS,OU=Faronics_Avast7,DC=labdom,DC=local" -NewName $computer -Credential $joincred -Restart -Force
