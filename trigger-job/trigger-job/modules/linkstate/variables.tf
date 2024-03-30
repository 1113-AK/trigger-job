variable "rgname" {
  description = "The name of the Azure resource group"
}

variable "linked_service_name" {}

variable "data_factory_id" {
  description = "The ID of the Azure Data Factory instance"
}

variable "databricks_workspace_id" {
  description = "The ID of the Azure Databricks workspace"
}

variable "databricks_access_token" {
  description = "The access token for Azure Databricks authentication"
}

variable "databricks_workspace_url" {
  description = "The URL of the Azure Databricks workspace"
}
