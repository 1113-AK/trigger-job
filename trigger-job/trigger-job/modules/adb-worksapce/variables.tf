variable "location" {}
variable "sku" {}
variable "resource_group_name" {
  description = "Name of the existing resource group where Databricks workspace will be created."
}

variable "databricks_workspace_name" {
  description = "Name of the Databricks workspace."
}
