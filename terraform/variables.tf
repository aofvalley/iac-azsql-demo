variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "westeurope"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
  default     = "SampleDB"
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
  sensitive   = true
  default     = null
}

variable "sku_name" {
  type        = string
  description = "The database sku name. For example, S0, S1, S2, P1, P2, P4, P6, P11, P15, PRS1, PRS2, PRS4, PRS6, PRS11, and PRS15."
  sensitive   = true
  default     = "S0"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for Azure resources."

  default = {
    demo  = "iac"
    demo  = "azsql"
  }
}
