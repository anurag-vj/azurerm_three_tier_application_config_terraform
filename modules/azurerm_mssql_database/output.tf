output "mssql_ids" {
  value = { for key, value in azurerm_mssql_server.sql_server : value.name => {
    id            = value.id
    database_name = azurerm_mssql_database.sql_database[key].name
    database_id   = azurerm_mssql_database.sql_database[key].id
    }
  }
}
