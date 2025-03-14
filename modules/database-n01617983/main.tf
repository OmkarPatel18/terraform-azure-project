resource "azurerm_postgresql_server" "postgresql" {
  name                = "n01617983-postgresql-server"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "B_Gen5_1"
  version             = "11"
  storage_mb          = 5120
  administrator_login          = "psqladmin"
  administrator_login_password = "P@ssw0rd1234!"
  ssl_enforcement_enabled      = true
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "postgresql_db" {
  name                = "n01617983-postgresql-db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
