module "main-k8s-cluster" {
  source = "./k8s-cluster/workspaces"

  configuration = var.k8s-config["environments"]
  subnetwork_id = module.vpc-main-subnetwork.subnetwork_id
  vpc_id = module.main-vpc.vpc_id
}