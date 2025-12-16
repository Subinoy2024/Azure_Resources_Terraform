resource "azurerm_network_interface" "this" {
  for_each = var.vms
  name                = "${each.value.name}-nic"
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.vms
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  size                = each.value.vm_size
  admin_username      = "azureuser"

  network_interface_ids = [azurerm_network_interface.this[each.key].id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
