variable "rgs" {
  type = map(object({
    names     = string
    locations = string
  }))
}