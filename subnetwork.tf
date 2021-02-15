module "vpc-main-subnetwork" {
  source = "./subnetwork/workspaces"

  configuration = var.subnetwork["environments"]
  vpc_id = module.main-vpc.vpc_id
}