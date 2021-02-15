locals {
  workspaces = {
    production = terraform.workspace == "production" ? var.configuration["production"] : var.configuration["staging"]
    staging    = terraform.workspace == "staging" ? var.configuration["staging"] : var.configuration["production"]
  }

  cfg = local.workspaces[terraform.workspace]

  ip_cidr_range = local.cfg["ip_cidr_range"]
  subnetwork_name = local.cfg["subnetwork_name"]
  purpose = local.cfg["purpose"]
  region = local.cfg["region"]

  secondary_ip_range = local.cfg["secondary_ip_range"]
  log_config = lookup(local.cfg, "log_config", {})

}
