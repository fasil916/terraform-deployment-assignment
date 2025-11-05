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



