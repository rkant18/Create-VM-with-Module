# ############ To Create New resource Group############
# module "source_rg" {
#   source                 = "../../module/RG"
#   azurerm_resource_group = var.rg
# }
# ######## To create New Virtual Network##############
# module "vnet_module" {
#   depends_on = [ module.source_rg ]
#   source = "../../module/Vnet"
#   vnet   = var.vnet
# }
# ###########  To Create new Subnet #############
# module "source_subnet" {
#   depends_on = [ module.vnet_module ]
#   source          = "../../module/subnet"
#   subnet-resource = var.subnet-resource
# }
# ############ To create New Interface network ##########
# module "source_interface" {
#   depends_on = [ module.source_subnet ]
#   source       = "../../module/VM/interface"
#   vm_interface = var.vm_interface
# }
# ######## To Create New Linux Virtual Machine ############
# # module "source_vm" {
# #   depends_on = [ var.vm_interface ]
# #   source       = "../../module/VM"
# #   vm_resources = var.vm_resources
# # }
# ######## To Create Public IP for access secured VM #######
# module "source_pip" {
#   source       = "../../module/Bastion"
#   azurerm_public_ip = var.azurerm_public_ip
#   bastion_host = var.bastion_host
# }
# ######## To Create bastion for access secured VM #######
# # module "source_bastion" {
# #   depends_on = [ var.vm_resources ]
# #   source       = "../../module/Bastion"
  
# # }
