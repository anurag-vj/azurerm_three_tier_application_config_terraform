variable "key_vault" {
  description = "values for key vault"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
