data "azurerm_network_interface" "vm-net" {
  name                = "vm-net"
  resource_group_name = "ats-dev"
}
resource "azurerm_linux_virtual_machine" "lnx-vm" {
  for_each              = var.vm_resources
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  network_interface_ids = [data.azurerm_network_interface.vm-net.id, ]
  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    name                 = each.value.os_name
    caching              = each.value.os_caching
    storage_account_type = each.value.os_storage_account_type

  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    version   = each.value.version
    sku       = each.value.sku
  }
}