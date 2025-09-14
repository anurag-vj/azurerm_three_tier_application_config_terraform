output "rg_ids" {
  value = module.resource_group.rg_ids
}

output "sa_ids" {
  value = module.storage_account.sa_ids
}

output "sc_ids" {
  value = module.storage_account.sc_ids
}

output "vnet_subnet_ids" {
  value = module.network_module.vnet_subnet_ids
}

output "bastion_ids" {
  value = module.bastion_host.bastion_ids
}

output "nsg_ids" {
  value = module.network_security_group.nsg_ids
}

output "kv_ids" {
  value = module.key_vault.kv_ids
}

output "vm_ids" {
  value = module.linux_virtual_machine.vm_ids
}

output "mssql_ids" {
  value = module.mssql_database.mssql_ids
}
