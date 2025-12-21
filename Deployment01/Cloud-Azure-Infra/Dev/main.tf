
############################
# RESOURCE GROUP
############################
module "resource_group" {
  source = "../../Modules-Azure/azurerm_resource_group"
  rgs    = var.rgs

}

############################
# STORAGE ACCOUNT
############################
module "storage_account" {
  depends_on = [ module.resource_group ]
  source = "../../Modules-Azure/azurerm_storage_account"

  storage_accounts = {
    for k, v in var.storage_accounts :
    k => {
      name                     = v.name
      account_tier             = v.account_tier
      account_replication_type = v.account_replication_type

      # resolved via RG module
      rg_name  = module.resource_group.names[v.rg_key]
      location = module.resource_group.locations[v.rg_key]
    }
  }
}

############################
# VNET + SUBNET (DYNAMIC)
############################
module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../../Modules-Azure/azurerm_virtual_network"

  vnets = {
    for k, v in var.vnets :
    k => {
      name          = v.name
      rg_name       = module.resource_group.names[v.rg_key]
      location      = module.resource_group.locations[v.rg_key]
      address_space = v.address_space
    }
  }

  subnets = var.subnets
}




############################
# NETWORK SECURITY GROUP
############################
module "nsg" {
  depends_on = [ module.virtual_network ]
  source = "../../Modules-Azure/azurerm_nsg"

  nsgs = {
    for k, v in var.nsgs :
    k => {
      name     = v.name
      rg_key   = v.rg_key
      rg_name  = module.resource_group.names[v.rg_key]
      location = module.resource_group.locations[v.rg_key]
      rules    = v.rules
    }
  }
}
################################
# PUBLIC IP
################################
module "pip" {
  depends_on = [ module.virtual_network ]
  source = "../../Modules-Azure/azurerm_public_ip"

  pip01 = {
    for k, v in var.pip01 :
    k => {
      name     = v.name
      rg_keys  = v.rg_key
      pip_key  = v.pip_key
      rg_name  = module.resource_group.names[v.rg_key]
      location = module.resource_group.locations[v.rg_key]
    }
  }
}




####################################
# NETWORK SECURITY GROUP ASSOCIATION
####################################

module "subnet_nsg_association" {
  depends_on = [module.resource_group, module.virtual_network, module.nsg]
  source     = "../../Modules-Azure/azurerm_nsg_association"

  associations = {
    db_subnet = {
      subnet_name = "db"
      vnet_name   = "vnet-preprod"
      nsg_name    = "remote_access"
      rg_name     = "HR"
    }
    app_subnet = {
      subnet_name = "app"
      vnet_name   = "vnet-preprod"
      nsg_name    = "remote_access"
      rg_name     = "HR"
    }


  }
}

####################################
# AZURE VIRTUAL MACHINE
####################################

module "AzureVM" {
  depends_on = [module.resource_group, module.virtual_network, module.pip, module.nsg, module.subnet_nsg_association]
  source     = "../../Modules-Azure/azurerm_virtual_machine"
  vms        = var.vms
}



# # ############################
# # # DATABASE
# # ############################
# # module "database" {
# #   source = "../.."

# #   databases = {
# #     for k, v in var.databases :
# #     k => {
# #       name     = v.name
# #       rg_name  = module.resource_group.names[v.rg_key]
# #       location = module.resource_group.locations[v.rg_key]
# #     }
# #   }
# # }

############################
# AKS
############################
# module "aks" {
#   source = "../../Modules-Azure/azurerm_aks"

#   aks_clusters = {
#     for k, v in var.aks_clusters :
#     k => {
#       name       = v.name
#       rg_name    = module.resource_group.names[v.rg_key]
#       location   = module.resource_group.locations[v.rg_key]
#       subnet_id  = module.virtual_network.subnet_ids[v.subnet_key]
#       node_count = v.node_count
#       vm_size    = v.vm_size
#     }
#   }
# }
