# This is to call resource group module
module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
# # This is to call storage account module
# module "storage" {
#   depends_on = [module.azurerm_resource_group]
#   source     = "../../modules/azurerm_storage_account"
#   storage    = var.storage

  
  
# }
# This is to call virtual network module
module "virtual_network" {
  depends_on      = [module.azurerm_resource_group]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
  subnets         = var.subnets
  
 
}

