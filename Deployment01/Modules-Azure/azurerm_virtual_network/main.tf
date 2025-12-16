############################
# VNET
############################
resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnets

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space

dynamic "subnet" {
    for_each = {
      for k, s in var.subnets :
      k => s if s.vnet_key == each.key
    }

    content {
      name             = subnet.key
      address_prefixes = [subnet.value.prefix]
  }
}
}


/*
############################
# SUBNETS (DYNAMIC VIA for_each)
############################
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.vnets[each.value.vnet_key].rg_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  address_prefixes     = [each.value.prefix]
}
*/