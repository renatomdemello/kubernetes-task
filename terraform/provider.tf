terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.25.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}"
  location = "East US"
}

module cluster {
  source = "./cluster"

  azurerm_resource_group_name = azurerm_resource_group.rg.name
  azurerm_resource_group_location = azurerm_resource_group.rg.location
  appId = var.appId
  password = var.password
}
