resource "azurerm_resource_group" "rg" {
  name     = var.AppName
  location = var.Location
}