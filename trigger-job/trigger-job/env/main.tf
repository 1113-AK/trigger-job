data "azurerm_resource_group" "rg" {
  name = "ius-lob-data-sand-inf-dlh-eu2-adb-rg-01"
}
data "azurerm_data_factory" "adf" {
  resource_group_name = data.azurerm_resource_group.rg
  name                = var.data_factory_id
  
}

data "azurerm_data_factory_linked_service_databricks" "ls" {
  name = var.linked_service_name
  
}



module "existing_databricks_workspace" {
  source                  = "C:/Users/Praveen Kumar/Documents/trigger-job/modules/adb-worksapce"
  resource_group_name     = data.azurerm_resource_group.rg
  databricks_workspace_name = var.databricks_workspace_name
  location = var.location
  sku = var.sku
}

module "data_factory" {
  source              = "C:/Users/Praveen Kumar/Documents/trigger-job/modules/datafactory"
  data_factory_name   = var.data_factory_name
  resource_group_name = data.azurerm_resource_group.rg
  location              = var.location 

}



module "example_data_factory_pipeline" {
  source = "C:/Users/Praveen Kumar/Documents/trigger-job/modules/adb-pipeline"

  pipeline_name    = var.pipeline_name
  data_factory_id  = var.data_factory_id
}




module "datafactory" {
  source = "C:/Users/Praveen Kumar/Documents/trigger-job/modules/linkstate"

  linked_service_name      = var.linked_service_name
  data_factory_id          = var.data_factory_id
  databricks_workspace_id  = var.databricks_workspace_id
  databricks_access_token  = var.databricks_access_token
  databricks_workspace_url = var.databricks_workspace_url
  rgname                   = data.azurerm_resource_group.rg
#   adb_domain               = var.adb_domain
}




module "databricks_linked_service" {
  source = "C:/Users/Praveen Kumar/Documents/trigger-job/modules/adb-trigger"

  data_factory_id       = var.data_factory_id
  linked_service_name   = var.linked_service_name
  # databricks_domain     = var.databricks_domain
  # databricks_access_token = var.databricks_access_token
  # databricks_resource_group = var.databricks_resource_group
  # databricks_workspace  = var.databricks_workspace
  notebook_path         = var.notebook_path
  notebook_link         = "https://adb-8605768895771677.17.azuredatabricks.net/?o=8605768895771677#notebook/3086748905279701"  # Provide the notebook_link value here
}




