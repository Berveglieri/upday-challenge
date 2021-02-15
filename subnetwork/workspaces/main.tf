module "main-vpc-network" {
  source = "../module/subnetwork"

  ip_cidr_range = local.ip_cidr_range
  purpose = local.purpose
  region = local.region
  secondary_ip_range = local.secondary_ip_range
  subnetwork_name = local.subnetwork_name
  vpc_id = var.vpc_id
  log_config = local.log_config

}