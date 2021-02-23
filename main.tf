module "resource_group" {
  source              = "./modules/resource-group"
  resource_group      = "wireguard-resource-group"
  location            = "australiaeast"
}

module "virtual_network" {
  source              = "./modules/virtual-networks"
  vnet_name           = "my-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = "australiaeast"
}

module "subnet" {
  source              = "./modules/subnets"
  subnet_name         = "default"
  address_prefix      = ["10.10.1.0/24"]
}

module "publicIP" {
  source              = "./modules/public-ip"
  publicIP_name       = "myPublicIP"
  allocation_method   = "Dynamic"
}

module "network_security_group" {
  source              = "./modules/network-security-group"
  nsg_name            = "myNetworkSecurityGroup"
  location            = "australiaeast"
}

module "network_interface_card" {
  source                          = "./modules/network-interface-card"
  nic_name                        = "myNIC"
  location                        = "australiaeasr"
  nicConfigurationName            = "myNicIPConfiguration"
  private_ip_allocation_method    = "Dynamic"
}

module "storage_account" {
  source                          = "./modules/storage-account"
  location                        = "australiaeast"
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
}

module "virtual_machine" {
  source = "./modules/virtual-machine"
  vm_name                           = "myServer"
  location                          = "australiaeast"
  vm_size                           = "Standard_DS1_v2"
  os_disk_name                      = "myOsDisk"
  os_disk_caching                   = "ReadWrite"
  os_disk_storage_account_type      = "Premium_LRS"
  source_image_reference_publisher  = "Openlogic"
  source_image_reference_offer      = "CentOs"
  source_image_reference_sku        = "8_2"
  source_image_reference_version    = "latest"
  admin_username                    = "azureuser"
  disable_password_authentication   = true
  ssh_key                           = file("~/.ssh/id_rsa.pub")
}