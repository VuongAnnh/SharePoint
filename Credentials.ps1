#region Imports
Import-Module SharePointPnPPowerShellOnline -WarningAction SilentlyContinue
#endregion Imports

#region Variables
$Username = "admin@geoff365.onmicrosoft.com"
$Password = "ThisIsNotMyRealPassword!"
$SiteCollection = "https://geoff365.sharepoint.com/sites/powershellplayground"
#endregion Variables

#region Credentials
[SecureString]$SecurePass = ConvertTo-SecureString $Password -AsPlainText -Force
[System.Management.Automation.PSCredential]$PSCredentials = New-Object System.Management.Automation.PSCredential($Username, $SecurePass)
#endregion Credentials

#region ConnectPnPOnline
try {
    Connect-PnPOnline -Url $SiteCollection -Credentials $PSCredentials
    if (-not (Get-PnPContext)) {
        Write-Host "Error connecting to SharePoint Online, unable to establish context" -foregroundcolor black -backgroundcolor Red
        return
    }
} catch {
    Write-Host "Error connecting to SharePoint Online: $_.Exception.Message" -foregroundcolor black -backgroundcolor Red
    return
}
#endregion ConnectPnPOnline