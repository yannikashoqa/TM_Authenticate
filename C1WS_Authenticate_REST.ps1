# REST Authentication
# Works for both PowerShell 5.1 and Core 7.x
# Need to use C1 API Key and set it as the value for $APIKEY

Clear-Host
Write-Host "################################  Start of Script  ################################"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$ErrorActionPreference = 'Stop'

$Manager    = "workload.trend-us-1.cloudone.trendmicro.com"
$APIKEY     = ""

$C1_URI     = "https://" + $Manager + "/rest"
$Authentication_URI = $C1_URI + "/authentication/login"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$DSCredentials = @{
    dsCredentials = @{
        c1ApiKey = $APIKEY
        }
}
$Payload = $DSCredentials | ConvertTo-Json 

try {
    $sID =  Invoke-RestMethod -Uri $Authentication_URI -Method Post -Headers $Headers -Body $Payload
    Write-Host "[INFO]  Connection Successful"
    Write-Host "sID: $sID"
}
catch {
    Write-Host "[ERROR]	Failed to Authenticate. $_"
    Exit
}

# Example:

$cookie = new-object System.Net.Cookie
$cookie.name = "sID"
$cookie.value =  $sID
$cookie.domain = $manager
$WebSession = new-object Microsoft.PowerShell.Commands.WebRequestSession
$WebSession.cookies.add($cookie)

$SmartFolders_URI = $C1_URI + "/smart-folders"
try {
    $SmartFolders = Invoke-RestMethod -Uri $SmartFolders_URI -Method Get -Headers $Headers -WebSession $WebSession
    $SmartFolders.ListSmartFoldersResponse.smartFolders
}
catch {
    Write-Host "[ERROR]	Failed to retreived Smart Folders.	$_"
    Exit
}

