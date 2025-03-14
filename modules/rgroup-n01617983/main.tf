resource "azurerm_resource_group" "rg" {
  name     = "n01617983-RG"
  location = var.location
  tags     = var.tags
}
