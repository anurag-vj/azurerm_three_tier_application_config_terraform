output "rg_ids" {
  value = { for key, value in azurerm_resource_group.rg : value.name => {
    id = value.id
  } }
}
