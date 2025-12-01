variable "rgs_parent" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "storage_accounts" {
  type = map(object({
    name                     = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(list(object({
      name = string
      address_prefixes = list(string) })
    ))
  }))

}

variable "pip_parent" {

  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string

  }))
}
variable "public_ip_ids" {
  type    = map(string)
  default = {}
}


variable "key_vault_parent" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    tenant_id                   = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}
variable "secret_parent" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    key_name            = string
    resource_group_name = string

  }))

}
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
      
    }))
  }))
}

variable "nsg_parent" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "nic_nsg_parent" {
  type = map(object({
    nic_name            = string
    resource_group_name = string
    nsg_name            = string

  }))

}

variable "vms" {
  type = map(object({
    name                            = string
    size                            = string
    resource_group_name             = string
    location                        = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = string
    nic_name                        = string
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

variable "sql_server_parent" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    version                       = string
    public_network_access_enabled = bool
    administrator_login           = optional(string)
    administrator_login_password  = optional(string)
    minimum_tls_version           = optional(string)
    azuread_administrators = optional(list(object({
      login_username = string
      object_id      = string
    })))
  }))
}

variable "sql_database_parent" {
  type = map(object({
    name                = string
    server_id           = string
    server_name         = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    resource_group_name = string

  }))

}

variable "bastion_parent" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    pip_name            = string
  }))
}
