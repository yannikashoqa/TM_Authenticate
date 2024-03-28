# SOAP Authentication
# Require PowerShell 5.1
# Need to use C1 API Key and set it as the value for $APIKEY

Clear-Host
Write-Host "################################  Start of Script  ################################"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$ErrorActionPreference = 'Stop'

$Manager    = "workload.us-1.cloudone.trendmicro.com"
$APIKEY     = ""
$Tenant     = "My Tenant"
$UserName   = "Authorization:ApiKey"
$Password   = $APIKEY

$C1_URI     = "https://" + $Manager + "/webservice/Manager?WSDL"

try {
   $objManager = New-WebServiceProxy -uri $C1_URI -namespace WebServiceProxy -class DSMClass
   $sID =  $objManager.authenticateTenant($Tenant,$UserName,$Password)
   Write-Host "sID: $sID"
}
catch {
   Write-Host "[ERROR]	Failed to Authenticate. $_"
   Exit
}

# Example:

$objManager.hostRetrieveAll($sID)