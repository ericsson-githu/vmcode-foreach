output "public_ip_ids" {
  description = "Public IP IDs"
  value = {
    for k, v in azurerm_public_ip.pip :
    k => v.id
  }
}
