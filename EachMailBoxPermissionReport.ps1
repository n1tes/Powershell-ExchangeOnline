Get-EXOMailbox -ResultSize unlimited |
        ForEach-Object {
        Get-MailboxPermission -Identity $_.identity | select Identity, User, Deny, AccessRights, IsInherited } | export-csv D:\ScriptOutput\WLMailboxPermission.csv -Append
            