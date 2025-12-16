# Providing the resource groups details
rgs = {
  rg = {
    name     = "gss-ind"
    location = "centralIndia"
    tags = {
      BAU         = "DevOps"
      owner       = "Subi"
      environment = "dev"
    }
    managed_by = "DCCompany"
  }
  rg = {
    name     = "gss-ind2"
    location = "centralIndia"
    tags = {
      BAU         = "DevOps"
      owner       = "Subi"
      environment = "dev"
    }
    managed_by = "DCCompany"

}
}

# storage = {
#   stg01 = {
#     name                              = "gssindstor01"
#     #resource_group_name               = var.resource_group_name[each.key]
#     location                          = "eastus"
#     account_tier                      = "Standard"
#     account_replication_type          = "LRS"
#     account_kind                      = "StorageV2"
#     provisioned_billing_model_version = "1.0"
#     cross_tenant_replication_enabled  = false
#     access_tier                       = "Hot"
#     edge_zone                         = null
#     https_traffic_only_enabled        = true
#     min_tls_version                   = "TLS1_2"
#     allow_nested_items_to_be_public   = false
#     shared_access_key_enabled         = true
#     public_network_access_enabled     = true
#     default_to_oauth_authentication   = false
#     is_hns_enabled                    = false
#     nfsv3_enabled                     = false
#     # custom_domain = {
#     #   name          = "storage.example.com"
#     #   use_subdomain = true
#     # }
#     # customer_managed_key = {
#     #   key_vault_key_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-kv/providers/Microsoft.KeyVault/vaults/kv-prod/keys/key1"
#     #   user_assigned_identity_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-id/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uid-storage"
#     # }

#     # identity = {
#     #   type         = "UserAssigned"
#     #   identity_ids = [
#     #     "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-id/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uid-storage"
#     #   ]
#     # }
#     # blob_properties = {}
#     # queue_properties = {}
#     # share_properties = {}


#     # static_website = {
#     #   index_document     = "index.html"
#     #   error_404_document = "404.html"
#     # }


#     # network_rules = {
#     #   default_action             = "Allow"
#     #   #bypass                     = ["AzureServices"]
#     #   #ip_rules                   = ["10.0.0.0/24"]
#     #   # virtual_network_subnet_ids = [
#     #     "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"
#     #   ]
#     # }

#     large_file_share_enabled          = true
#     local_user_enabled                = false
#     azure_files_authentication        = {}
#     routing                           = {}
#     queue_encryption_key_type         = "Service"
#     table_encryption_key_type         = "Service"
#     infrastructure_encryption_enabled = true
#     immutability_policy               = {}
#     sas_policy                        = {}
#     allowed_copy_scope                = "AAD"
#     sftp_enabled                      = false
#     dns_endpoint_type                 = "Standard"

#     tags = {
#       environment = "dev"
#       BAU         = "DevOps"
#       owner       = "subi"
#       #costcenter  = "1230101045"
#     }
#   }
# }


virtual_network = {
  vnet1 = {
    name                = "vnet-dev"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "gss-ind2"
    tags = {
      environment = "dev"
      owner       = "subi"
    }
  }
}

subnets = [
  {
    name           = "subnet01"
    address_prefix = "10.0.0.0/23"
  },
  {
    name           = "subnet02"
    address_prefix = "10.0.2.0/23"
  }
]
# environment = "dev"
#  business_divsion = "DevSecOps"