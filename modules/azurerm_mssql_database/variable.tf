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
