data "azurerm_resource_group" "rg" {
  name = "ius-lob-data-sand-inf-dlh-eu2-adb-rg-01"
}


resource "azurerm_data_factory_linked_service_azure_databricks" "at_linked" {
  name                = var.linked_service_name
  resource_group_name = data.azurerm_resource_group.rg.name
  data_factory_id     = var.data_factory_id
  description         = "ADB Linked Service via Access Token"
  existing_cluster_id = var.databricks_workspace_id

  access_token = var.databricks_access_token
  adb_domain   = var.databricks_workspace_url
}