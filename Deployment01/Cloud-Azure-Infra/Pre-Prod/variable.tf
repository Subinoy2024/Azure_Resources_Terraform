variable "rgs" {
}

variable "storage_accounts" {
}
/*

variable "vnets" {
  type = map(object({
    name          = string
    rg_key        = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    vnet_key = string
    prefix   = string
    nsg_key  = string
  }))
}

variable "nsgs" {
  type = map(object({
    name   = string
    rg_key = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "databases" {
  type = map(object({
    name   = string
    rg_key = string
  }))
}

variable "aks_clusters" {
  type = map(object({
    name        = string
    rg_key      = string
    subnet_key  = string
    node_count = number
    vm_size    = string
  }))
}
*/