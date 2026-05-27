terraform {
  required_version = ">= 1.5.0"
}

module "app" {
  source = "./modules/app"

  resource_group_name = "${var.application_name}-${var.environment_name}-rg"
  location            = var.location
  tags = {
    application = var.application_name
    environment = var.environment_name
    managed_by  = "terraform"
  }
}
