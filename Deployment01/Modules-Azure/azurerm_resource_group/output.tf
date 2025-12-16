output "names" {
  value = { for k, v in azurerm_resource_group.this : k => v.name }
}

output "locations" {
  value = { for k, v in azurerm_resource_group.this : k => v.location }
}
