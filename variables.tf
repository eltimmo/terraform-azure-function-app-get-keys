variable "resource_group_name" {
  type        = string
  description = "Name of the pre-existing resource group for resource creation"
}

variable "function_app_id" {
  type        = string
  description = "ID of the function app"
}

variable "key_set" {
  type        = string
  description = "Keyset to look for key typically functionKeys or systemKeys"
}

variable "key" {
  type        = string
  description = "Specific key to try and fetch"
}