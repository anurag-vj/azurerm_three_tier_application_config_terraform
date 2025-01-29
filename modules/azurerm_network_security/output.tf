output "nsg_ids" {
  value = { for key, value in azurerm_network_security_group.nsg : value.name => value.id }
}
