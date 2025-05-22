#get serial
$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber

#set new name
$computer = "$SerialNumber"

#get credentials
$user = $args[0]
$pass = $args[1]
$joincred = New-Object pscredential -argumentlist ([pscustomobject]@{
UserName = $user
Password = (ConvertTo-SecureString -String $pass -asplaintext -force)[0]
})

#join domain
Add-Computer -DomainName labdom.local -OUPath "OU=Staff-WSUS,OU=Faronics_Avast7,DC=labdom,DC=local" -NewName $computer -Credential $joincred -Restart -Force
