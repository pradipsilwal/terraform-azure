resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.myTerraformResourceGroup.name
  }

  byte_length = 8
}

# The following section creates a storage account, with the
# name based on the random text generated in the preceding step:
resource "azurerm_storage_account" "myTerraformStorageAccount" {
    name = "diag${random_id.randomId.hex}"
    resource_group_name = azurerm_resource_group.myTerraformResourceGroup.name
    location = var.location
    account_replication_type = var.account_replication_type
    account_tier = var.account_tier
}