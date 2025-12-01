resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  auxiliary_sku       = each.value.auxiliary_sku
  auxiliary_mode      = each.value.auxiliary_mode
  tags                = each.value.tags

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.subnet_ids[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      # public_ip_address_id = try(var.public_ip_ids[each.key], null)
     public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id

    }
  }
}
