data "azurerm_subnet" "subnet" {
  for_each             = var.virtual_machine
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  for_each            = var.virtual_machine
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

resource "random_password" "admin_password" {
  for_each         = var.virtual_machine
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.virtual_machine
  name         = "admin-password-${each.value.name}"
  value        = random_password.admin_password[each.key].result
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
