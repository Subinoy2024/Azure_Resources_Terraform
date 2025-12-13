# This is to call resource group module
module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}