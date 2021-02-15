module "main-k8s-cluster" {
  source = "../module/k8s-cluster"

  addons_config = local.addons_config
  cluster_name = local.cluster_name
  ip_allocation_policy = local.ip_allocation_policy
  location = local.location
  network_policy = local.network_policy
  subnetwork_id = var.subnetwork_id
  version_prefix = local.version_prefix
  vpc_id = var.vpc_id
  node_pool = local.node_pools
}