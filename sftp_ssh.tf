//Refer azapi provider in provider.tf 

resource "azapi_resource" "api_connecton_sftpssh" {
  type                      = "Microsoft.Web/connections@2018-07-01-preview"
  name                      = "test-apiconn-sftpssh"
  location                  = azurerm_resource_group.testrg.location
  parent_id                 = azurerm_resource_group.testrg.id
  schema_validation_enabled = false
  tags = {
  }

  body = jsonencode({
    properties = {
      api = {
        displayName = "SFTP - SSH"
        id          = "/subscriptions/5d76e31d-afc6-495f-9426-5f9f7377a3f3/providers/Microsoft.Web/locations/centralus/managedApis/sftpwithssh"
      }
      displayName = "Azure SFPT SSH",
      parameterValues = {
        hostName   = "abcd"
        userName   = "abcdefgh"
        portNumber = "22"
        password   = "test"
        acceptAnySshHostKey = true
        sshPrivateKey = var.key //Required if password not given
      },
    }
  })
}