output "vm_ids" {
  value = { for key, value in azurerm_linux_virtual_machine.linux_vm : value.name => {
    id             = value.id
    admin_username = value.admin_username
    public_ip      = azurerm_public_ip.vm_pip[key].ip_address
    private_ip     = azurerm_network_interface.nic[key].private_ip_address
  } }
}
