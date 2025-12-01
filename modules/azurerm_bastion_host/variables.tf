variable "bastion_child" {
  type = map(object({
    name           = string
    location            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    pip_name            = string

  }))
}