resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

dynamic "os_disk" {
    for_each = each.value.os_disks == null ? {} : each.value.os_disks
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }
 dynamic "source_image_reference" {
    for_each = each.value.source_image_references == null ? {} : each.value.source_image_references
    content {
      publisher = source_image_reference.value.publisher
      version   = source_image_reference.value.version
      sku       = source_image_reference.value.sku
      offer     = source_image_reference.value.offer
    }
  }
}
