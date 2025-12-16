# This is to create local variable for resource group names
# locals {
#   rg_name = {                  #interpolating resource group name with key
#     for k, v in var.rgs :      #for loop to iterate through the map (Key=K, Value=v)
#     k => "${v.name}-${k}"   #interpolating resource group name with key
#   }
# }

# locals {
#   rg_name = {
#     for k, v in var.rgs :
#     k => "${v.name}-${k}-${random_integer.rg_suffix[k].result}"
#   }
# }