data "azurerm_resource_group" "rg" {
  name = "ius-lob-data-sand-inf-dlh-eu2-adb-rg-01"
}

resource "azurerm_databricks_workspace" "existing_databricks" {
  name                = var.databricks_workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.sku
}
  