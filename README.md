# terraform-azure-function-app-get-keys
Terraform module to retrieve Azure Function App Keys

This module can be called to as part of a terraform deployment to return function keys. This code runs a powershell 7 script as a data source to get the key of your choice and return it.

This uses powershell 7 core, so in theory will work on Linux however I have not been able to test this.

Variables need to be supplied as defined in variables.tf
