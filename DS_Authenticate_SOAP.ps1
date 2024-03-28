# SOAP Authentication
# Require PowerShell 5.1

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

$WSDL       = "/webservice/Manager?WSDL"
$DSM_URI    = "https://" + $Manager + ":" + $Port + $WSDL

try {
   $objManager = New-WebServiceProxy -uri $DSM_URI -namespace WebServiceProxy -class DSMClass
   $sID =  $objManager.authenticate($UserName,$Password)
   Write-Host "sID: $sID"
}
catch {
   Write-Host "[ERROR]	Failed to Authenticate. $_"
   Exit
}

# Example:

$objManager.hostRetrieveAll($sID)
