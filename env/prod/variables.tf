variable "application_name" {
  description = "Base application name used when composing the resource group name."
  type        = string
}

variable "environment_name" {
  description = "Environment name."
  type        = string
}

variable "location" {
  description = "Azure region for the resource group."
  type        = string
}
