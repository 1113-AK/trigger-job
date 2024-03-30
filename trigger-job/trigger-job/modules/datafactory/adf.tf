data "azurerm_resource_group" "rg" {
  name = "ius-lob-data-sand-inf-dlh-eu2-adb-rg-01"
}


resource "azurerm_data_factory" "existing_data_factory" {
  name                = var.data_factory_name
  location            = var.location  # Specify the location of the existing resource group
  resource_group_name = data.azurerm_resource_group.rg.name  # Specify the name of the existing resource group
}
