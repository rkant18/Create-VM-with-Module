resource "azurerm_network_interface" "vm-net" {
  for_each            = var.vm_interface
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = each.value.ip_con_name
    private_ip_address_allocation = each.value.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.subnet-data.id
      }
}