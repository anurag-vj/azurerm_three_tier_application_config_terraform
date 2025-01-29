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
