# This is resource group creation block 
resource "azurerm_resource_group" "rgdetail"{
    for_each = var.rgs
    name = local.rg_name[each.key]
    location = each.value.location
    tags = each.value.tags
    managed_by = each.value.managed_by
}
resource "random_integer" "rg_suffix" {
  for_each = var.rgs
  min = 10
  max = 99
}
