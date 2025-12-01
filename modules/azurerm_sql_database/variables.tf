variable "sql_database_child" {
 type = map(object({
  name = string
  server_id    = string
  server_name    = string
  collation    = string
  license_type = string
  max_size_gb  = number
  sku_name     = string
  enclave_type = string
  resource_group_name = string

    }))
  
}