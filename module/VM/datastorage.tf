data "azurerm_network_interface" "vm-net" {
  name                = "vm-net"
  resource_group_name = "ats-dev"
}
data "azurerm_key_vault" "ats" {
  name = "ats-key"
  resource_group_name = "ats-dev"
}
data "azurerm_key_vault_secret" "username" {
  name = "username"
  key_vault_id = data.azurerm_key_vault.ats.id
}
data "azurerm_key_vault_secret" "password" {
  name = "password"
  key_vault_id = data.azurerm_key_vault.ats.id
}