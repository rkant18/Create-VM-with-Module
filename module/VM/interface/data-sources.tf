data "azurerm_subnet" "subnet-data" {
  name                 = "ats-dev-subnet"
  resource_group_name  = "ats-dev"
  virtual_network_name = "ats-vnet-bastion"
}

# output "azurerm_subnet_id" {
#   value = data.azurerm_subnet.subnet-data.id
# }

