variable "storage" {
  description = "Storage account variable information keyed by a logical name."
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind                             = optional(string)
    provisioned_billing_model_version        = optional(string)
    cross_tenant_replication_enabled         = optional(bool)
    access_tier                              = optional(string)
    edge_zone                                = optional(string)
    https_traffic_only_enabled               = optional(bool)
    min_tls_version                          = optional(string)
    allow_nested_items_to_be_public          = optional(bool)
    shared_access_key_enabled                = optional(bool)
    public_network_access_enabled            = optional(bool)
    default_to_oauth_authentication           = optional(bool)
    is_hns_enabled                           = optional(bool)
    nfsv3_enabled                            = optional(bool)
    
    # custom_domain                            = optional(object({
    #   name          = string
    #   use_subdomain = optional(bool)
    # }))
    
    # customer_managed_key                     = optional(object({
    #   key_vault_key_id          = string
    #   user_assigned_identity_id = optional(string)
    # }))
    
    # identity                                 = optional(object({
    #   type         = string
    #   identity_ids = optional(list(string))
    # }))
    
    # blob_properties                          = optional(any)
    # queue_properties                         = optional(any)
    # static_website                           = optional(object({
    #   index_document     = string
    #   error_404_document = optional(string)
    # }))
    
    # share_properties                         = optional(any)
    # network_rules                            = optional(object({
    #   default_action             = string
    #   bypass                     = optional(list(string))
    #   ip_rules                   = optional(list(string))
    #   virtual_network_subnet_ids = optional(list(string))
    # }))
    
    large_file_share_enabled                 = optional(bool)
    local_user_enabled                       = optional(bool)
    azure_files_authentication               = optional(any)
    routing                                  = optional(any)
    queue_encryption_key_type                = optional(string)
    table_encryption_key_type                = optional(string)
    infrastructure_encryption_enabled        = optional(bool)
    immutability_policy                      = optional(any)
    sas_policy                               = optional(any)
    allowed_copy_scope                       = optional(string)
    sftp_enabled                             = optional(bool)
    dns_endpoint_type                        = optional(string)
    tags                                     = optional(map(string))
  }))
}
