resource "azurerm_network_security_group" "nsg" {
  for_each            = var.network_security_group
  name                = "nsg-${each.value.subnet_name}"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.inbound_open_ports

    content {
      name                       = "Allow-${security_rule.value}"
      priority                   = ceil((security_rule.value % 9) + 130)
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assocoation" {
  for_each                  = var.network_security_group
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
