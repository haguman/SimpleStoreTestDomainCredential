[System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.AccountManagement") | Out-Null
$username = Read-Host -Prompt "Please enter your username : "
$netbios_domain = Read-Host -Prompt "Please enter netbios domain  : "
$domaincred = New-Object ûTypeName "System.Management.Automation.PSCredential" ûArgumentList ($netbios_domain+"\"+$mgmtdwrusername), $(Read-Host -Prompt "Please enter your password : " -AsSecureString)
$domaincred | %{"password correct ? " + (New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Domain, $($_.GetNetworkCredential().Domain ) ) ).ValidateCredentials($_.GetNetworkCredential().UserName, $_.GetNetworkCredential().Password).ToString()}
