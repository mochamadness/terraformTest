output "resource_group_id" {
  description = "ID of the Azure resource group."
  value       = azurerm_resource_group.this.id
}

output "resource_group_name" {
  description = "Name of the Azure resource group."
  value       = azurerm_resource_group.this.name
}
