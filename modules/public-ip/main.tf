resource "azurerm_public_ip" "myTerraformPublicIP" {
  name = var.publicIP_name
  location = var.location
  resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
  allocation_method = var.allocation_method
}