variable "vnets" {
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    vnet_key = string
    prefix   = string
  }))
}
