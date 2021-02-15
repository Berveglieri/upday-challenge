output "vpc_id" {
  value = google_compute_network.main-vpc.id
}

output "gateway_ipv4_id" {
  value = google_compute_network.main-vpc.gateway_ipv4
}