variable "cluster_name" {
  type = string
  description = "The name of the cluster."
}

variable "location" {
  type = string
  description = "The location of the cluster."
}

variable "version_prefix" {
  type = string
  description = "The version of the cluster and the node pools that are going to be created."
}

variable "addons_config" {
  type = list(object({
    horizontal_pod_autoscaling = bool
    http_load_balancing = bool
    network_policy_config = bool
    cloudrun_config = bool
    }))
  description = "Cluster addons configuration."
}

variable "network_policy" {
  type = list(object({
    enabled = bool
    provider = string
  }))
  description = "Enable or disable network policy."
}

variable "ip_allocation_policy" {
  type = list(object({
    cluster_secondary_range_name = string
    services_secondary_range_name = string
  }))
  description = "The cluster network allocation policy."
}

variable "vpc_id" {
  type = string
  description = "The id of the VPC to create the cluster."
}

variable "subnetwork_id" {
  type = string
  description = "The id of the network of the cluster."
}

variable "node_pool" {
  type = list(object({
    node_pool_name = string
    max_pods_per_node = number
    node_count = number
    node_config = object({
      preemptible = bool
      machine_type = string
      disk_size_gb = number
      disk_type = string
      image_type = string
    })
  }))
}