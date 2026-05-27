terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "environment" {
  source = "../.."

  application_name = var.application_name
  environment_name = var.environment_name
  location         = var.location
}

output "resource_group_name" {
  description = "Name of the prod resource group."
  value       = module.environment.resource_group_name
}
