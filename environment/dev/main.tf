# This is to call resource group module
module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
# This is to call storage account module
module "storage" {
  source  = "../../modules/azurerm_storage_account"
  storage = var.storage
}