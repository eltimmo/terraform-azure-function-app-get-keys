# terraform-azure-function-app-get-keys
Terraform module to retrieve Azure Function App Keys

This module can be called to as part of a terraform deployment to return function keys. This code runs a powershell 7 script as a data source to get the key of your choice and return it.

This will try to recover the key, waiting 10 seconds between each retry for a maximum of 30 attempts. These can be changed in the powershell code as required.

This uses powershell 7 core and Azure CLI, so in theory will work on Linux however I have not been able to test this.

Variables need to be supplied as defined in variables.tf
