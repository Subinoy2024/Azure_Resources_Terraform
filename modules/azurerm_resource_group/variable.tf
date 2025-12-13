# this variable defines a map of resource group configurations
variable "rgs" {
description = "Map of Resource Group configuration"
type = map(object({
name = string
location = string
tags = optional(map(string))
managed_by = optional(string)
}))
}
# this variable defines a map of resource group configurations
variable "rgs" {
  description = "Map of Resource Group configuration"
  type = map(object({
    name       = string
    location   = string
    tags       = optional(map(string))
    managed_by = optional(string)
  }))
}