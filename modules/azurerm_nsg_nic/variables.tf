variable "nic_nsg_child" {
  type = map(object({
    nic_name = string
    resource_group_name = string
    nsg_name = string

  }))


}