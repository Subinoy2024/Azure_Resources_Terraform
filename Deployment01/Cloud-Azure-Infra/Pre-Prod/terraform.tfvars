rgs = {
  rg1 = {
    names     = "HR"
    locations = "East US"
  }
}
storage_accounts = {
  sa1 = {
    name                     = "hrstorage123"
    rg_key                   = "rg1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}


vnets = {
  vnet1 = {
    name          = "vnet-preprod"
    rg_key        = "rg1"
    address_space = ["10.0.0.0/16"]
  }
   vnet2 = {
    name          = "vnet-preprod2"
    rg_key        = "rg1"
    address_space = ["10.0.1.0/27"]
  }
}

subnets = {
  app = {
    vnet_key = "vnet1" #k
    prefix   = "10.0.1.0/24" #v
  }
  db = {
    vnet_key = "vnet1"
    prefix   = "10.0.2.0/24"
  }
}

/*
nsgs = {
  app_nsg = {
    name   = "app-nsg"
    rg_key = "rg1"

    rules = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
*/