output "subnetwork_id" {
  value = google_compute_subnetwork.vpc-main-network.id
}

output "gateway_address" {
  value = google_compute_subnetwork.vpc-main-network.gateway_address
}