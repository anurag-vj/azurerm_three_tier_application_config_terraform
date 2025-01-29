data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
    for_each = var.key_vault
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    enabled_for_disk_encryption = true
    soft_delete_retention_days = 7
    purge_protection_enabled = false
    tenant_id = data.azurerm_client_config.current.tenant_id

    sku_name = "standard"

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        key_permissions = ["Get"]
        secret_permissions = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]
        storage_permissions = ["Get"]
    }
}