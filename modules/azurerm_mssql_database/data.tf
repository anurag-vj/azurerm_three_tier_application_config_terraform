data "azurerm_key_vault" "key_vault" {
  for_each            = var.mssql
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

resource "random_password" "administrator_login_password" {
  for_each         = var.mssql
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "administrator_login_password" {
  for_each     = var.mssql
  name         = "admin-password-${each.value.name}"
  value        = random_password.administrator_login_password[each.key].result
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
