
############################
# LOOKUP SUBNET
############################
data "azurerm_subnet" "subnet" {
  for_each = var.vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

############################
# LOOKUP PUBLIC IP
############################
data "azurerm_public_ip" "pip" {
  for_each = var.vms

  name                = each.value.name
  resource_group_name = each.value.rg_name
}
