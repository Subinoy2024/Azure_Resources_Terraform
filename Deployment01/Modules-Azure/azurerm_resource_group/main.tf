resource "azurerm_resource_group" "this" {
  for_each = var.rgs
  name     = each.value.names
  location = each.value.locations
}
