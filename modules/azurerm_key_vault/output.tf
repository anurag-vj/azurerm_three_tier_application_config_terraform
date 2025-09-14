output "kv_ids" {
  value = { for key, value in azurerm_key_vault.key_vault : value.name => value.id }
}
