resource "azurerm_subnet" "myTerraformSubnet" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
  virtual_network_name = azurerm_virtual_network.myTerraformVirtualNetwork.name
  address_prefixes = var.address_prefix
}