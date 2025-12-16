############################
# VNET
############################
resource "azurerm_virtual_network" "this" {
  for_each = var.vnets

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
}

############################
# SUBNETS (DYNAMIC CREATION)
############################
resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.vnets[each.value.vnet_key].rg_name
  virtual_network_name = azurerm_virtual_network.this[each.value.vnet_key].name
  address_prefixes     = [each.value.prefix]
}

############################
# SUBNET → NSG ASSOCIATION
############################
resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.subnets

  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = each.value.nsg_id
}

output "subnet_ids" {
  value = { for k, v in azurerm_subnet.this : k => v.id }
}
