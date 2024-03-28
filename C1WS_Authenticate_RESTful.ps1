# RESTful Authentication
# Require PowerShell Core 7.x
# Need to use C1 API Key and set it as the value for $APIKEY in the format "ApiKey APIKEY"

Clear-Host
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$ErrorActionPreference = 'Stop'

$Manager    = "workload.trend-us-1.cloudone.trendmicro.com"
$APIKEY     = "ApiKey <Your API Key>"

$C1_URI     = "https://" + $Manager + "/api/"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $APIKEY)
$headers.Add("api-version", 'v1')

# Example
$ComputersAPIPath = "computers"
$C1WS_Computers_URI = $C1_URI + $ComputersAPIPath

try {
    $Computers =  Invoke-RestMethod -Uri $C1WS_Computers_URI -Method Get -Headers $Headers
    Write-Host "[INFO]  Connection Successful"
    $Computers.computers
}
catch {
    Write-Host "[ERROR]	Failed to Authenticate. $_"
    Exit
}