#### Search for the email in exchange online for mass deletion ####
### Created 03-10-25 NS
#### Run this command with extreme caution. REQUIRES ExchangeOnlineManagement module 3.9.0 or above

# Connect to Exchange Online Security & Compliance Module with admin credential
# prereq: Install-Module -Name ExchangeOnlineManagement, Admin account specifically needs to be in the "Search & Purge" group (Purview)

    Connect-IPPSSession -UserPrincipalName admin_ns@zipwater.com -EnableSearchOnlySession # CHANGE THIS

# Give Search a relevant Name
    $SearchName = "Call-Alert_InSubject" # CHANGE THIS and Give it a relevant name

New-ComplianceSearch -Name $SearchName `
  -ExchangeLocation All `
  -ContentMatchQuery 'subject:"Call-Alert - V.M MSG*" AND received>=2025-10-02' # CHANGE THIS AS REQUIRED

## Run below to start the above searchs

    Start-ComplianceSearch -Identity $SearchName

# To check the status [Above command will take 3-5 mins to complete]
    Get-ComplianceSearch -Identity $SearchName

# If completed, you can see the result to see how many hit it got.
    Get-ComplianceSearch -Identity $SearchName | Select -ExpandProperty successresults

# To export above result in txt file for easy searchability  [OPTIONAL]
#Get-ComplianceSearch -Identity $SearchName | Select -ExpandProperty successresults | Out-File <Path\Filename.txt>


  # FINALLY, deleting the email. Always use "SoftDelete Option"
  # With SoftDelete command, messages are moved to the Deletions folder in the user's Recoverable Items folder
 ## New-ComplianceSearchAction -SearchName $SearchName -Purge -PurgeType SoftDelete ## UNCOMMENT AND RUN THIS.


##Just a note: The Organization Management role group exists in both Exchange Online
  ## and in the Microsoft Purview portal. These are separate role groups that
  ## give different permissions. Being a member of Organization Management in Exchange Online
  ## does not grant the required permissions to delete email messages. If you aren't assigned
  ## the Search And Purge role in the Microsoft Purview portal (either directly or through a role
  ## group such as Organization Management), you'll receive an error in Step 3 when you run the
  ## New-ComplianceSearchAction cmdlet with the message "A parameter cannot be found that matches parameter name 'Purge'".

