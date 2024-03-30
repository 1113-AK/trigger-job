data "azurerm_resource_group" "rg" {
  name = "ius-lob-data-sand-inf-dlh-eu2-adb-rg-01"
}

resource "azurerm_data_factory_pipeline" "adb-pipeline" {
  name            = var.pipeline_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id = var.data_factory_id
}