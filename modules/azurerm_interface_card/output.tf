output "inc_ids" {
  value = {for k, r in azurerm_network_interface.nic : k => r.id }
}
