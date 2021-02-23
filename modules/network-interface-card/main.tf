resource "azurerm_network_interface" "myTerraformNetworkInterfaceCard" {
  name = var.nic_name
  location = var.location
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name

  ip_configuration {
    name = var.nicConfigurationName
    subnet_id = azurerm_subnet.myTerraformSubnet.id
    private_ip_address_allocation = var.private_ip_allocation_method
    public_ip_address_id = azurerm_public_ip.myTerraformPublicIP.id
    
  }
}

resource "azurerm_network_interface_security_group_association" "myTerraformNsgAssociation" {
  network_interface_id = azurerm_network_interface.myTerraformNetworkInterfaceCard.id
  network_security_group_id = azurerm_network_security_group.myTerraformNetworkSecurityGroup.id
}