output "bastion_ids" {
  value = { for key, value in azurerm_bastion_host.bastion_host : value.name => {
    id                   = value.id
    public_ip            = azurerm_public_ip.bastion_pip[key].ip_address
    public_ip_address_id = value.ip_configuration[0].public_ip_address_id
  } }
}
