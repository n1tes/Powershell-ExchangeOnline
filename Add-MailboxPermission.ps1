## This script adds mailbox Permission

#Connecting to exchange online

#Connect-ExchangeOnline -UserPrincipalName admin_ns@zipwater.com #####Change the admin credential to yours.####

 

 

#This can also be user's name. And you can have a list of names either here or in a separate text file.

$MailboxToGiveAccess = "noreply.billing@zipwater.com", "noreply.purchasing@zipwater.com", "itunesfirst@zipwater.com", "itunes.fourth@zipwater.com", "itunes.mailbox@zipwater.com", "itunessecond@zipwater.com", "itunes.third@zipwater.com", "JohnDoumaniTeamsInvite@zipwater.com", "mobility@zipwater.com", "powerbi.gateway@zipwater.com", "soxprontoreview@zipwater.com", "dmarc_rua@zipindustries.onmicrosoft.com", "dmarc_ruf@zipindustries.onmicrosoft.com", "exclaimercloud@zipindustries.com"

 

#User to who you are assigning permission to

$userRequiringPermission = "nitesh.shrestha@zipwater.com"         # "Nitesh Shrestha" or "Email"

 

 

Foreach ($mailbox in $MailboxToGiveAccess){

Add-MailboxPermission -Identity $mailbox -User $userRequiringPermission -AccessRights FullAccess -InheritanceType All -AutoMapping $false ####AutoMapping false does not add the mailbox to users outlook ####


#Remove-MailboxPermission -Identity $mailbox -User $userRequiringPermission -AccessRights FullAccess
 

}

 

 

####To check mailbox Permission ####

# Get-MailboxPermission mikeabbottbusinessupdate@zipwater.com

 

 

#### To remove mailbox permission ####

#Remove-MailboxPermission -Identity mikeabbottbusinessupdate@zipwater.com -User "Nitesh Shrestha" -AccessRights FullAccess