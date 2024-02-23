#$credential = Get-Credential

#Connect-ExchangeOnline -UserPrincipalName admin_ns@XXX.com

Get-Mailbox -ResultSize unlimited |
    ForEach-Object {
        Get-MailboxStatistics -Identity $_.UserPrincipalName | 
            Select-Object DisplayName, LastLogonTime, LastUserActionTime}