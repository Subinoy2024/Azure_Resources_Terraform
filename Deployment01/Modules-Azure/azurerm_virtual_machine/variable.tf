variable "vms"{
    type=map(object({
  nic_name=string
  location=string
  resource_group_name=string
  vnet_name=string
  subnet_name=string
  public_ip=string
  vm_name=string
  size=string
  admin_username=string
  admin_password=string
  os_disk =map(string)
  source_image_reference=map(string)
  tags =map(string)
}))
}