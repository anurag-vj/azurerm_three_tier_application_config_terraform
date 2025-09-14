output "vnet_subnet_ids" {
  value = { for key, value in azurerm_virtual_network.vnet : value.name => {
    id            = value.id
    address_space = value.address_space

    subnet = { for subnet_key, subnet_value in value.subnet : subnet_value.name => {
      address_prefixes = subnet_value.address_prefixes
    } }
  } }
}
