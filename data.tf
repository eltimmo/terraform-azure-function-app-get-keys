data "external" "function_keys" {
  program = ["pwsh", "${local.get_key_ps1}", "${var.function_app_id}", "${var.key_set}", "${var.key}"]
}