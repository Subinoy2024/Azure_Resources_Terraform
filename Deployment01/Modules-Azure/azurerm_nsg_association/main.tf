# resource "azurerm_subnet_network_security_group_association" "example" {
#   for_each=var.associations
#   subnet_id                 = each.value.subnet_id
#   network_security_group_id = each.value.network_security_group_id
# }
data "azurerm_subnet" "subnet" {
  for_each = var.associations

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_network_security_group" "nsg" {
  for_each = var.associations

  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.associations

  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
