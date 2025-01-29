output "sa_ids" {
  value = { for key, value in azurerm_storage_account.strg : value.name => value.id }
}

output "sc_ids" {
  value = { for key, value in azurerm_storage_container.container : value.name => value.id }
}
