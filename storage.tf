resource "azurerm_storage_account" "st" {
  name                     = "${lower("${var.AppName}")}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "main"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_storage_share" "share" {
  name                 = "setup"
  storage_account_name = azurerm_storage_account.st.name
  quota                = 50
}



# resource "azurerm_storage_share_file" "sshfile" {
#   name             = "id_rsa"
#   storage_share_id = azurerm_storage_share.share.id
#   source           = var.systemsshfile
# }

# resource "azurerm_storage_share_file" "pspayload" {
#   name             = "PsPayload.ps1"
#   storage_share_id = azurerm_storage_share.share.id
#   source           = "../DscPayload/PsPayload.ps1"
# }
