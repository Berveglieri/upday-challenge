variable "vpc_network_name" {
  type        = string
  description = "The name of the vpc network."
}

variable "prefix" {
  type        = string
  description = "The prefix of the resource."
}

variable "auto_create_subnets" {
  type        = bool
  description = "Define if auto subnet mode should be True or False."
}

variable "routing_mode" {
  type        = string
  description = "The network-wide routing mode to use."
}

variable "mtu" {
  type        = number
  default     = 1460
  description = "Maximum Transmission Unit in bytes."
}

variable "default_route_deletion" {
  type        = bool
  default     = false
  description = "If set to True deletes the default route."
}