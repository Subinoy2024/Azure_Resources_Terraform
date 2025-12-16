
# output "rg_names" {
#   description = "Resource group names keyed by logical name"
#   value = {
#     for k, rg in azurerm_resource_group.rgdetail :
#     k => rg.name
#   }
# }
