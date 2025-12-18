
  vms= {
    vm1={
  nic_name="nic1"
  location="East US"
  rg_name="HR"
  vnet_name="vnet-preprod"
  subnet_name="app"
  public_ip="publicip01"
  vm_name="vm1"
  size="Standard_DS1_v2"
  admin_username="vmadmin"
  admin_username="Ipmith@1234567"
  storage_image_reference =  {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
    }

    }