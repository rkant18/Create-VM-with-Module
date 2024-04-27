rg = {
  dev_resource = {
    name     = "ats-dev"
    location = "eastus"
  }
}
vnet = {
  vnet1 = {
    name                = "ats-vnet-bastion"
    address_space       = ["192.168.0.0/16"]
    resource_group_name = "ats-dev"
    location            = "eastus"

  }
}
subnet-resource = {
  subnet1 = {
    name                 = "ats-dev-subnet"
    resource_group_name  = "ats-dev"
    virtual_network_name = "ats-vnet-bastion"
    address_prefixes     = ["192.168.1.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "ats-dev"
    virtual_network_name = "ats-vnet-bastion"
    address_prefixes     = ["192.168.2.0/28"]
  }
}
vm_interface = {
  nic1 = {
    name                          = "vm-net"
    resource_group_name           = "ats-dev"
    location                      = "eastus"
    ip_con_name                   = "vm-net-nic"
    private_ip_address_allocation = "Dynamic"
  }
    nic2 = {
    name                          = "vm-net-clone"
    resource_group_name           = "ats-dev"
    location                      = "eastus"
    ip_con_name                   = "vm-net-nic-clone"
    private_ip_address_allocation = "Dynamic"
  }
}
vm_resources = {
  vm1 = {
    name = "vm-net"
    resource_group_name           = "ats-dev"
    location                      = "eastus"
    ip_con_name                   = "vm-net-nic"
    private_ip_address_allocation = "Dynamic"
    vm_name                 = "lnxvm1"
    size                    = "Standard_F2"
    os_name                 = "os"
    os_caching              = "ReadWrite"
    os_storage_account_type = "Standard_LRS"
    publisher               = "Canonical"
    offer                   = "0001-com-ubuntu-server-jammy"
    sku                     = "22_04-lts"
    version                 = "latest"
  }
    vm2 = {
    name = "vm-net-clone"
    resource_group_name           = "ats-dev"
    location                      = "eastus"
    ip_con_name                   = "vm-net-nic-clone"
    private_ip_address_allocation = "Dynamic"
    vm_name                 = "lnxvm-clone"
    size                    = "Standard_F2"
    os_name                 = "os"
    os_caching              = "ReadWrite"
    os_storage_account_type = "Standard_LRS"
    publisher               = "Canonical"
    offer                   = "0001-com-ubuntu-server-jammy"
    sku                     = "22_04-lts"
    version                 = "latest"
  }
}
azurerm_public_ip = {
   pip ={   
  pip_name            = "ats-vnet-ip"
  location            = "eastus"
  resource_group_name = "ats-dev"
  allocation_method   = "Static"
  sku                 = "Standard"
} }
bastion_host = {
  bastion1 = {
      name                = "ats_bastion"
      location            = "eastus"
      resource_group_name = "ats-dev"
      ip_conf_name        = "configuration"
  }
}