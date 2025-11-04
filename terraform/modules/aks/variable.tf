variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "aks-cluster"
}

variable "location" {
  description = "The Azure region where the Kubernetes cluster will be deployed"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "aks-rg"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
  default     = "aks-cluster"
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the VM for the node pool"
  type        = string
  default     = "Standard_B2ms"
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    environment = "production"
  }
}
