resource "azurerm_resource_group" "myTerraformResourceGroup" {
  name = var.resource_group
  location = var.location
}