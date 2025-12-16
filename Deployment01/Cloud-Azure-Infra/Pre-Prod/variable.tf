variable "rgs" {
}
variable "storage_accounts" {
}
variable "vnets" {
}
variable "subnets" {
}

variable "nsgs" {
}
# variable "associations" {}
/*
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