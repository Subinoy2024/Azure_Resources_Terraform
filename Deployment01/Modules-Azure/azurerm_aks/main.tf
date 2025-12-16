resource "azurerm_kubernetes_cluster" "this" {
  for_each = var.aks_clusters
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.name

  default_node_pool {
    name           = "system"
    node_count     = each.value.node_count
    vm_size        = each.value.vm_size
    vnet_subnet_id = each.value.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }
}
