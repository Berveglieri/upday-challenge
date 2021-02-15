locals {
  workspaces = {
    production = terraform.workspace == "production" ? var.configuration["production"] : var.configuration["staging"]
    staging    = terraform.workspace == "staging" ? var.configuration["staging"] : var.configuration["production"]
  }

  cfg = local.workspaces[terraform.workspace]

  vpc_network_name    = local.cfg["vpc_network_name"]
  auto_create_subnets = local.cfg["auto_create_subnets"]
  routing_mode        = local.cfg["routing_mode"]
}