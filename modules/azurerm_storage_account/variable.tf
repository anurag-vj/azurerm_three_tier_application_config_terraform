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