variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group" {
  description = "values for resource group"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "storage_account" {
  description = "variable for storage account and storage containers"
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
    container_access_type    = optional(string)
  }))
}

variable "virtual_network" {
  description = "values for virtual network and subnet"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "bastion_host" {
  description = "values for bastion host"
  type = map(object({
    bastion_name         = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
  }))
}

variable "network_security_group" {
  description = "values for network security group"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    inbound_open_ports   = list(number)
  }))
}

variable "key_vault" {
  description = "values for key vault"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

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


variable "mssql" {
  description = "values for the mssql server"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    version             = string
    administrator_login = string
    key_vault_name      = string
  }))
}
