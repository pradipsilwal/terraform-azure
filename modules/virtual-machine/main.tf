resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = var.vm_name
    location              = var.location
    resource_group_name   = azurerm_resource_group.myTerraformResourceGroup.name
    network_interface_ids = [azurerm_network_interface.myTerraformNetworkInterfaceCard.id]
    size                  = var.vm_size

    os_disk {
        name                    = var.os_disk_name
        caching                 = var.os_disk_caching
        storage_account_type    = var.os_disk_storage_account_type
    }

    source_image_reference {
        publisher = var.source_image_reference_publisher
        offer     = var.source_image_reference_offer
        sku       = var.source_image_reference_sku
        version   = var.source_image_reference_version
    }

    computer_name                       = var.vm_name
    admin_username                      = var.admin_username
    disable_password_authentication     = var.disable_password_authentication
        
    admin_ssh_key {
        username       = var.admin_username
        public_key     = var.ssh_key
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.myTerraformStorageAccount.primary_blob_endpoint
    }
}