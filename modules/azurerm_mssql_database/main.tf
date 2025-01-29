resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.mssql
  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = azurerm_key_vault_secret.administrator_login_password[each.key].value
}

resource "azurerm_mssql_database" "sql_database" {
  for_each  = var.mssql
  name      = "db-${each.value.name}"
  server_id = azurerm_mssql_server.sql_server[each.key].id
}

resource "azurerm_mssql_firewall_rule" "sql_firewall_rule" {
  for_each         = var.mssql
  name             = "${each.value.name}-firewall-rule"
  server_id        = azurerm_mssql_server.sql_server[each.key].id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
