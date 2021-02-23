resource "azurerm_virtual_network" "myTerraformVirtualNetwork" {
  name = var.vnet_name
  address_space = var.address_space
  location = var.location
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
}