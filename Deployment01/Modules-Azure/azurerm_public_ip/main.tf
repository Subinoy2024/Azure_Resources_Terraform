
################################
# PUBLIC IP
################################
resource "azurerm_public_ip" "pip1" {
    for_each=var.pip01
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   ="Static"
}
