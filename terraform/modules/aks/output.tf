output "kubernetes_cluster_id" {
  description = "The ID of the created AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.aks_rg.id
}
