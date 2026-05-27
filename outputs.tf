output "resource_group_id" {
  description = "ID of the created Azure resource group."
  value       = module.app.resource_group_id
}

output "resource_group_name" {
  description = "Name of the created Azure resource group."
  value       = module.app.resource_group_name
}
