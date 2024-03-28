# RESTful Authentication
# Require PowerShell Core 7.x
# Need a Deep Security API Key and set it as the value of $DS_APIKEY

Clear-Host
Write-Host "################################  Start of Script  ################################"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
$ErrorActionPreference = 'Stop'

$Manager    = "dsm.example.com"
$DS_APIKEY  = ""
$PORT       = "4119"

$DS_headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$DS_headers.Add("api-secret-key", $DS_APIKEY)
$DS_headers.Add("api-version", 'v1')
$DS_headers.Add("Content-Type", 'application/json')

$DS_HOST_URI = "https://" + $Manager + ":" + $PORT + "/api/"

# Example

$AdministratorsAPIPath = "administrators"
$DS_Administrators_URI = $DS_HOST_URI + $AdministratorsAPIPath
$DS_Administrators = Invoke-RestMethod -Uri $DS_Administrators_URI -Method Get -Headers $DS_headers -SkipCertificateCheck
$DS_Administrators.administrators