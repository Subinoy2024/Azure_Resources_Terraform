
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



/*
############################
# NETWORK SECURITY GROUP
############################
module "nsg" {
  source = "../../Modules-Azure/azurerm_nsg"

  nsgs = {
    for k, v in var.nsgs :
    k => {
      name     = v.name
      rg_name  = module.resource_group.names[v.rg_key]
      location = module.resource_group.locations[v.rg_key]
      rules    = v.rules
    }
  }
}

/*
############################
# VIRTUAL MACHINE
############################
module "virtual_machine" {
  source = "../../Modules-Azure/azurerm_virtual_machine"

  vms = {
    for k, v in var.vms :
    k => {
      name       = v.name
      vm_size   = v.vm_size
      rg_name   = module.resource_group.names[v.rg_key]
      location  = module.resource_group.locations[v.rg_key]
      subnet_id = module.virtual_network.subnet_ids[v.subnet_key]
    }
  }
}

# ############################
# # DATABASE
# ############################
# module "database" {
#   source = "../.."

#   databases = {
#     for k, v in var.databases :
#     k => {
#       name     = v.name
#       rg_name  = module.resource_group.names[v.rg_key]
#       location = module.resource_group.locations[v.rg_key]
#     }
#   }
# }

############################
# AKS
############################
module "aks" {
  source = "../../Modules-Azure/azurerm_aks"

  aks_clusters = {
    for k, v in var.aks_clusters :
    k => {
      name       = v.name
      rg_name    = module.resource_group.names[v.rg_key]
      location   = module.resource_group.locations[v.rg_key]
      subnet_id  = module.virtual_network.subnet_ids[v.subnet_key]
      node_count = v.node_count
      vm_size    = v.vm_size
    }
  }
}
*/