terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
  required_version = ">= 0.14"
}

provider "azapi" {
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "testrg" {
  name = "testrg"
  location = "centralus"
}