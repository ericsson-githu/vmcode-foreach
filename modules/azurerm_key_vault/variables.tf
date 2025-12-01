variable "key_vault_child" {

  type = map(object({
    name                        = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    tenant_id                   = string
    location                    = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool

    sku_name = string
   
  }))
}
