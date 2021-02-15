resource "google_compute_network" "main-vpc" {
  name                            = "${var.prefix}-${var.vpc_network_name}"
  auto_create_subnetworks         = var.auto_create_subnets
  routing_mode                    = var.routing_mode
  mtu                             = var.mtu
  delete_default_routes_on_create = var.default_route_deletion
}