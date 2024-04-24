resource "azurerm_resource_group" "rg" {
  for_each = var.azurerm_resource_group
  name     = each.value.name
  location = each.value.location
}