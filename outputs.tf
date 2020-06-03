output "function_key" {
  value = lookup(data.external.function_keys.result, var.key)
}
