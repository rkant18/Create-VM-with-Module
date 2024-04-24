data "azurerm_subnet" "AzureBastionSubnet" {
  name = "AzureBastionSubnet"
  resource_group_name = "ats-dev"
  virtual_network_name = "ats-vnet-bastion"
}

resource "azurerm_public_ip" "ats_ip" {
  for_each = var.azurerm_public_ip
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

data "azurerm_public_ip" "pip" {
depends_on = [ azurerm_public_ip.ats_ip ]
  name = "ats-vnet-ip"
  resource_group_name = "ats-dev"
  }
     
resource "azurerm_bastion_host" "ats_bastion" {
  depends_on = [ azurerm_public_ip.ats_ip ]
  for_each = var.bastion_host
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_conf_name
    subnet_id            = data.azurerm_subnet.AzureBastionSubnet.id
     public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}