variable "configuration" {
  type        = any
  description = "Map structure to retrieve the configuration values for the module from the *.tfvars file"
}

variable "vpc_id" {
  type = string
  description = "the id of the vpc to link the subnetwork."
}