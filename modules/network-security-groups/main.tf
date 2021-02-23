resource "azurerm_network_security_group" "myTerraformNetworkSecurityGroup" {
  name = var.nsg_name
  location = var.location
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
}

resource "azurerm_network_security_rule" "ssh_rule" {
  name = "SSH"
  priority = 500
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
  network_security_group_name = azurerm_network_security_group.myTerraformNetworkSecurityGroup.name
}

resource "azurerm_network_security_rule" "wireguard_rule" {
  name = "wireguard"
  priority = 600
  direction = "Inbound"
  access = "Allow"
  protocol = "Udp"
  source_port_range = "*"
  destination_port_range = "51820"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
  network_security_group_name = azurerm_network_security_group.myTerraformNetworkSecurityGroup.name
}