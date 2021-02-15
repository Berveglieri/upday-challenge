module "main-vpc" {
  source = "../module/vpc"

  auto_create_subnets = local.auto_create_subnets
  routing_mode        = local.routing_mode
  vpc_network_name    = local.vpc_network_name
  prefix              = terraform.workspace
}