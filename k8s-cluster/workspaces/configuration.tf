locals {
  workspaces = {
    production = terraform.workspace == "production" ? var.configuration["production"] : var.configuration["staging"]
    staging    = terraform.workspace == "staging" ? var.configuration["staging"] : var.configuration["production"]
  }

  cfg = local.workspaces[terraform.workspace]

  cluster_name = local.cfg["cluster_name"]
  location = local.cfg["location"]
  version_prefix = local.cfg["version_prefix"]
  addons_config = local.cfg["addons_config"]
  network_policy = local.cfg["network_policy"]
  ip_allocation_policy = local.cfg["ip_allocation_policy"]
  node_pools = local.cfg["node_pools"]

}