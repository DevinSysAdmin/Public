#Always log what we do
Start-Transcript

#Install the modules (-Force incase they're already installed, this would be an update)
Install-Module -Name AzureAD -Force
Install-Module MSOnline -Force

#Import those modules
Import-Module AzureAD
Import-Module MSOnline

#Prompt for your credentials, never store credentials in a script
$Credentials = Get-Credential

#Connect to Msol
Connect-MsolService 

#Identify the Application
$objectId = Get-MsolServicePrincipal | ?{ $_.AppPrincipalId -eq "300e65c0b3f4-4b46-b3d5-51d99dda4edf" } | select -ExpandProperty ObjectId

#Grant it Company Administrator rights to fix this mess
Add-MsolRoleMember -RoleName "Company Administrator" -RoleMemberType ServicePrincipal -RoleMemberObjectId $objectId 