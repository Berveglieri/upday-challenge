variable "prod_project_id" {
  default     = "stock-price-294103"
  description = "Project ID of the production environment"
}

variable "stg_project_id" {
  default     = ""
  description = "Project ID of the staging environment"
}

variable "terraform_prod_auth" {
  default     = "creds/terraform-prod-auth.json"
  description = "Credentials from production environment"
}

variable "terraform_stg_auth" {
  default     = "creds/terraform-stg-auth.json"
  description = "Credentials from staging environment"
}

variable "vpc" {
  type        = map(map(map(string)))
  description = "Map, holding configuration of all vpcs."
}

variable "subnetwork" {
  type        = map(map(object({
    ip_cidr_range = string
    purpose = string
    region = string
    secondary_ip_range = list(object({
      ip_cidr_range = string
      range_name = string
    }))
    log_config = list(object({
      aggregation_interval = string
      flow_sampling        = number
      metadata             = string
      metadata_fields      = list(string)
      filter_expr          = bool
    }))
    subnetwork_name = string
  })))
  description = "Map, holding configuration of all subnetworks."
}

variable "k8s-config" {
  type = any
  description = "Map, holding configuration of the cluster."
}