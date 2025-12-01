variable "vms" {
  type = map(object({
    name             = string
    size                = string
    resource_group_name = string
    location            = string
    admin_username      = string
    admin_password      = string
    disable_password_authentication = string
    nic_name            = string
    os_disks = map(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_references = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    script_name = optional(string)
  }))
}
