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
