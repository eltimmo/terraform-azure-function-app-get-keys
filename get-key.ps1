
param (
  [Parameter(Mandatory=$true)][string]$functionID,
  [Parameter(Mandatory=$true)][string]$keySet,
  [Parameter(Mandatory=$true)][string]$key
)

$retries = 30
$matchedKey = $false
  
do {
  $response = az rest --method post --uri $functionID/host/default/listKeys?api-version=2018-11-01 --query $keySet
  $keys = $response | ConvertFrom-Json

if ($keys.$key) {
  $matchedKey = $true
}

if ($matchedKey -eq $false) {
  Start-Sleep 10
  $retries--
}

} while ($retries -ge 0 -and $matchedKey -eq $false)

if ($keys.$key) {
  $response
}
  