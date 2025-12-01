variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name = string
    auxiliary_sku        = optional(string)
    auxiliary_mode       = optional(string)
    tags                 = optional(map(string))
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
      
      
    }) )
  }))
}

variable "public_ip_ids" {
  type    = map(string)
  default = {}
}
