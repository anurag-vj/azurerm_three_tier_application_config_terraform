module "resource_group" {
  source         = "../modules/azurerm_resource_group"
  resource_group = var.resource_group
}

module "storage_account" {
  source          = "../modules/azurerm_storage_account"
  storage_account = var.storage_account
  depends_on      = [module.resource_group]
}

module "network_module" {
  source          = "../modules/azurerm_network_module"
  virtual_network = var.virtual_network
  depends_on      = [module.resource_group]
}

module "bastion_host" {
  source       = "../modules/azurerm_bastion_host"
  bastion_host = var.bastion_host
  depends_on   = [module.network_module]
}

module "network_security_group" {
  source                 = "../modules/azurerm_network_security"
  network_security_group = var.network_security_group
  depends_on             = [module.network_module]
}

module "key_vault" {
  source     = "../modules/azurerm_key_vault"
  key_vault  = var.key_vault
  depends_on = [module.resource_group]
}

module "linux_virtual_machine" {
  source          = "../modules/azurerm_linux_virtual_machine"
  virtual_machine = var.virtual_machine
  depends_on      = [module.network_module, module.key_vault]
}

module "mssql_database" {
  source     = "../modules/azurerm_mssql_database"
  mssql      = var.mssql
  depends_on = [module.key_vault]
}
