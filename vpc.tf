module "main-vpc" {
  source = "./vpc/workspaces"

  configuration = var.vpc["environments"]
}