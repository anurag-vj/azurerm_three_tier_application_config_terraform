variable "network_security_group" {
  description = "values for network security group"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    inbound_open_ports    = list(number)
  }))
}
