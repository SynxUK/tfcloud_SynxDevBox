resource "azurerm_resource_group" "rg" {
  name     = var.AppName
  location = "uk-south"
}