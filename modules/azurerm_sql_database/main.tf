resource "azurerm_mssql_database" "sql_database" {
 for_each = var.sql_database_child
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.serverid[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

}

