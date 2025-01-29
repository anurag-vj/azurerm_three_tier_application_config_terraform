variable "virtual_machine" {
  description = "A map of virtual machine objects"
  type = map(object({
    subnet_name                     = string
    virtual_network_name            = string
    resource_group_name             = string
    location                        = string
    key_vault_name                  = string
    name                            = string
    size                            = string
    admin_username                  = string
    disable_password_authentication = bool
    caching                         = string
    storage_account_type            = string
    publisher                       = string
    offer                           = string
    sku                             = string
    version                         = string
  }))
}
