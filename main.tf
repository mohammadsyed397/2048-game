
# Create a resource group (if it doesn't exist)
resource "azurerm_resource_group" "Kubernetes" {
  name     = "Kubernetes-ResourceGroup"
  location = "Central US"
}

# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "My-cluster" {
  name                = "my-cluster"  
  location            = azurerm_resource_group.Kubernetes.location
  resource_group_name = azurerm_resource_group.Kubernetes.name
  dns_prefix          = "my-cluster"  

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }
  

}

# Output the kubeconfig to access the cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.My-cluster.kube_config_raw
  sensitive = true
}
