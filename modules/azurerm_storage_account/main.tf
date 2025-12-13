resource "azurerm_storage_account" "storage_details" {
  for_each = var.storage
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind                      = lookup(each.value, "account_kind", null)
  access_tier                       = lookup(each.value, "access_tier", null)
  edge_zone                         = lookup(each.value, "edge_zone", null)
  https_traffic_only_enabled        = lookup(each.value, "https_traffic_only_enabled", null)
  min_tls_version                   = lookup(each.value, "min_tls_version", null)
  allow_nested_items_to_be_public   = lookup(each.value, "allow_nested_items_to_be_public", null)
  shared_access_key_enabled         = lookup(each.value, "shared_access_key_enabled", null)
  public_network_access_enabled     = lookup(each.value, "public_network_access_enabled", null)
  default_to_oauth_authentication   = lookup(each.value, "default_to_oauth_authentication", null)
  is_hns_enabled                    = lookup(each.value, "is_hns_enabled", null)
  nfsv3_enabled                     = lookup(each.value, "nfsv3_enabled", null)
  large_file_share_enabled          = lookup(each.value, "large_file_share_enabled", null)
  local_user_enabled                = lookup(each.value, "local_user_enabled", null)
  infrastructure_encryption_enabled = lookup(each.value, "infrastructure_encryption_enabled", null)
  allowed_copy_scope                = lookup(each.value, "allowed_copy_scope", null)
  sftp_enabled                      = lookup(each.value, "sftp_enabled", null)
  dns_endpoint_type                 = lookup(each.value, "dns_endpoint_type", null)
#   dynamic "identity" {
#     for_each = each.value.identity != null ? [each.value.identity] : []
#     content {
#       type         = identity.value.type
#       identity_ids = lookup(identity.value, "identity_ids", null)
#     }
#   }
#   dynamic "custom_domain" {
#     for_each = each.value.custom_domain != null ? [each.value.custom_domain] : []
#     content {
#       name          = custom_domain.value.name
#       use_subdomain = lookup(custom_domain.value, "use_subdomain", null)
#     }
#   }
#   dynamic "customer_managed_key" {
#     for_each = each.value.customer_managed_key != null ? [each.value.customer_managed_key] : []
#     content {
#       key_vault_key_id          = customer_managed_key.value.key_vault_key_id
#       user_assigned_identity_id = lookup(customer_managed_key.value, "user_assigned_identity_id", null)
#     }
#   }
#   dynamic "network_rules" {
#     for_each = each.value.network_rules != null ? [each.value.network_rules] : []
#     content {
#       default_action             = network_rules.value.default_action
#       bypass                     = lookup(network_rules.value, "bypass", null)
#       ip_rules                   = lookup(network_rules.value, "ip_rules", null)
#       virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", null)
#     }
#   }
#   dynamic "static_website" {
#     for_each = each.value.static_website != null ? [each.value.static_website] : []
#     content {
#       index_document     = static_website.value.index_document
#       error_404_document = lookup(static_website.value, "error_404_document", null)
#     }
#   }
  tags = lookup(each.value, "tags", {})
}
