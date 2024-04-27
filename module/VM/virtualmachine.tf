resource "azurerm_linux_virtual_machine" "lnx-vm" {
  for_each              = var.vm_resources
  name                  = each.key
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = data.azurerm_key_vault_secret.username.value
  admin_password        = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [data.azurerm_network_interface.vm-net[each.key].id, ]
  # admin_ssh_key {
  #   username   = each.value.admin_username
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }
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