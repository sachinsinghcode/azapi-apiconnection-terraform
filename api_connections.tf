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


//
resource "azapi_resource" "keybasedApiConn" {
  type                      = "Microsoft.Web/connections@2018-07-01-preview"
  name                      = "key-based-api-connected"
  location                  = azurerm_resource_group.testrg.location
  parent_id                 = azurerm_resource_group.testrg.id
  schema_validation_enabled = false
  tags = {
  }
 

  body = jsonencode({
    properties = {
      api = {
        displayName = "Azure Blob Storage"
        id          = "/subscriptions/5d76e31d-afc6-495f-9426-5f9f7377a3f3/providers/Microsoft.Web/locations/centralus/managedApis/azureblob"
      }
      displayName = "Azure Storage",
      parameterValueSet = {
        name = "keyBasedAuth",
        values = {
            accountName= {
                value= "Storage Account Name"
              }
            accessKey = {
                value = "Key Value"
            }
          }
      },
    }
  })
}

resource "azapi_resource" "managedIdentityApiConn" {
  type                      = "Microsoft.Web/connections@2018-07-01-preview"
  name                      = "managed-identity-apiconn"
  location                  = azurerm_resource_group.testrg.location
  parent_id                 = azurerm_resource_group.testrg.id
  schema_validation_enabled = false
  tags = {
  }
 

  body = jsonencode({
    properties = {
      api = {
        displayName = "Azure Blob Storage"
        id          = "/subscriptions/5d76e31d-afc6-495f-9426-5f9f7377a3f3/providers/Microsoft.Web/locations/centralus/managedApis/azureblob"
      }
      displayName = "Azure Storage",
      parameterValueSet = {
        name   = "managedIdentityAuth",
        values = {}
      },
    }
    }
  )
}