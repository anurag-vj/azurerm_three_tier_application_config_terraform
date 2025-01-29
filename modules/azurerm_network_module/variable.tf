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
