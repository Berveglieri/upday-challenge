variable "ip_cidr_range" {
  type = string
  description = "The range of internal addresses that are owned by this subnetwork."
}

variable "subnetwork_name" {
  type = string
  description = "The subnetwork name."
}

variable "vpc_id" {
  type = string
  description = "The id of the vpc."
}

variable "purpose" {
  type = string
  description = "The purpose of this network, This field can be either PRIVATE or INTERNAL_HTTPS_LOAD_BALANCER."
}

variable "secondary_ip_range" {
  type = list(object({
    range_name = string
    ip_cidr_range = string
  }))
  description = "An array of configurations for secondary IP ranges."
}

variable "private_ip_google_access" {
  default = null
  type = string
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "private_ipv6_google_access" {
  default = null
  type = string
  description = "The private IPv6 google access type for the VMs in this subnet."
}

variable "region" {
  type = string
  description = "The GCP region for this subnetwork."
}

variable "log_config" {
  type = list(object({
    aggregation_interval = string
    flow_sampling        = number
    metadata             = string
    metadata_fields      = list(string)
    filter_expr          = bool
  }))
  description = "Denotes the logging options for the subnetwork flow logs."
}

