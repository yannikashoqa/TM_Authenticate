# REST Authentication
# Require PowerShell Core 7.x.  To use Powershell 5.1, remove the option -SkipCertificateCheck from the Invoke-RestMethod commands

Clear-Host
Write-Host "################################  Start of Script  ################################"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$ErrorActionPreference = 'Stop'

$Config             = (Get-Content "$PSScriptRoot\DS-Config.json" -Raw) | ConvertFrom-Json
$Manager            = $Config.MANAGER
$Port               = $Config.PORT
$UserName           = $Config.USER_NAME
$Password           = $Config.PASSWORD

$DSM_URI            = "https://" + $Manager + ":" + $Port + "/rest"
$Authentication_URI = $DSM_URI + "/authentication/login"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$DSCredentials = @{
    dsCredentials = @{
        userName = $UserName
        password = $Password 
        }
}
$Payload = $DSCredentials | ConvertTo-Json 

try {
    $sID =  Invoke-RestMethod -Uri $Authentication_URI -Method Post -Headers $Headers -Body $Payload -SkipCertificateCheck
    Write-Host "[INFO]  Connection Successful"
    Write-Host "sID: $sID"
}
catch {
    Write-Host "[ERROR]Failed to Authenticate. $_"
    Exit
}

# Example:

$cookie = new-object System.Net.Cookie
$cookie.name = "sID"
$cookie.value =  $sID
$cookie.domain = $manager
$WebSession = new-object Microsoft.PowerShell.Commands.WebRequestSession
$WebSession.cookies.add($cookie)

$Administrators_URI = $DSM_URI + "/administrators"
try {
    $Administrators = Invoke-RestMethod -Uri $Administrators_URI -Method Get -Headers $Headers -WebSession $WebSession -SkipCertificateCheck
    $Administrators.ListAdministratorsResponse.administrators
}
catch {
    Write-Host "[ERROR]	Failed to retreived the Administrators.	$_"
    Exit
}

