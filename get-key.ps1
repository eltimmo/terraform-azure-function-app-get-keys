
param (
  [Parameter(Mandatory=$true)][string]$functionID,
  [Parameter(Mandatory=$true)][string]$keySet,
  [Parameter(Mandatory=$false)][string]$key
)

$retries = 10
$matchedKey = $false
  
do {
  $response = az rest --method post --uri $functionID/host/default/listKeys?api-version=2018-11-01 --query $keySet
  $keys = $response | ConvertFrom-Json

  if ($keys.$key) {
    $matchedKey = $true
  }

  if ($keySet -eq 'masterKey' -and $keys -ne '') {
    $matchedKey = $true
  }

  if ($matchedKey -eq $false) {
    Start-Sleep 10
    $retries--
  }

} while ($retries -ge 0 -and $matchedKey -eq $false)

if ($matchedKey) {
  if ($keySet -eq 'masterKey') {
    '{  ' + ('"masterKey": {0}' -f($response)) + '  }'   
  }
  else {
    $response
  }
}