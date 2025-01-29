subscription_id = "1863e903-68c1-4e05-a0cb-40e0bcb9a2df"

resource_group = {
  rg_1 = {
    name     = "rg-dev-application-001"
    location = "central india"
  }
}

storage_account = {
  strg-1 = {
    name                     = "strgdevapplication001"
    location                 = "central india"
    resource_group_name      = "rg-dev-application-001"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    container_access_type    = "private"
  }
}


virtual_network = {
  vnet_1 = {
    name                = "vnet-dev-application-001"
    location            = "central india"
    resource_group_name = "rg-dev-application-001"
    address_space       = ["10.0.0.0/16"]
    subnet = {
      subnet_1 = {
        name             = "subnet-dev-application-FE"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet_2 = {
        name             = "subnet-dev-application-BE"
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet_3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.100.0/24"]
      }
    }
  }
}

bastion_host = {
  bastion_1 = {
    bastion_name         = "bastion-dev-application-001"
    location             = "central india"
    resource_group_name  = "rg-dev-application-001"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev-application-001"
  }
}

network_security_group = {
  nsg_1 = {
    subnet_name          = "subnet-dev-application-FE"
    virtual_network_name = "vnet-dev-application-001"
    location             = "central india"
    resource_group_name  = "rg-dev-application-001"
    inbound_open_ports   = [22, 80]
  }
  nsg_2 = {
    subnet_name          = "subnet-dev-application-BE"
    virtual_network_name = "vnet-dev-application-001"
    location             = "central india"
    resource_group_name  = "rg-dev-application-001"
    inbound_open_ports   = [22, 8000]
  }
}

key_vault = {
  kv_1 = {
    name                = "kv-dev-application-001"
    location            = "central india"
    resource_group_name = "rg-dev-application-001"
  }
}

virtual_machine = {
  vm_1 = {
    subnet_name                     = "subnet-dev-application-FE"
    virtual_network_name            = "vnet-dev-application-001"
    resource_group_name             = "rg-dev-application-001"
    location                        = "central india"
    key_vault_name                  = "kv-dev-application-001"
    name                            = "vm-dev-application-FE"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  vm_2 = {
    subnet_name                     = "subnet-dev-application-BE"
    virtual_network_name            = "vnet-dev-application-001"
    resource_group_name             = "rg-dev-application-001"
    location                        = "central india"
    key_vault_name                  = "kv-dev-application-001"
    name                            = "vm-dev-application-BE"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-focal"
    sku                             = "20_04-LTS"
    version                         = "latest"
  }
}

mssql = {
  masql_1 = {
    name                = "mssql-dev-application-001"
    location            = "central india"
    resource_group_name = "rg-dev-application-001"
    version             = "12.0"
    administrator_login = "adminuser"
    key_vault_name      = "kv-dev-application-001"
  }
}
