module "aks_cluster" {
  source              = "./modules/aks"  # Path to your module directory
  cluster_name        = "my-aks-cluster"
  location            = "Central India"
  resource_group_name = "my-aks-rg"
  dns_prefix          = "my-aks-cluster"
  node_count          = 1 
  vm_size             = "Standard_B2s"
  os_disk_size_gb     = 40
  tags = {
    environment = "staging"
  }
}

output "aks_cluster_id" {
  value = module.aks_cluster.kubernetes_cluster_id
}

output "aks_resource_group_id" {
  value = module.aks_cluster.resource_group_id
}


resource "azurerm_resource_group" "tf_backend_rg" {
  name     = "tfstate-rg"
  location = "Central India"
}


resource "azurerm_storage_account" "tf_backend_storage" {
  name                     = "tfstatestore12345"
  resource_group_name      = azurerm_resource_group.tf_backend_rg.name
  location                 = azurerm_resource_group.tf_backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false


}

# Create storage container for Terraform state
resource "azurerm_storage_container" "tf_backend_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_backend_storage.name
  container_access_type = "private"

}


