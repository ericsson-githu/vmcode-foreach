output "vnet_ids" {
  value = {for k, f in azurerm_virtual_network.virtual_network : k => f.id }
}



