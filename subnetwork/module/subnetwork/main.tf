resource "google_compute_subnetwork" "vpc-main-network" {
  ip_cidr_range = var.ip_cidr_range
  name = var.subnetwork_name
  network = var.vpc_id

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range
    content {
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
      range_name = secondary_ip_range.value.range_name
    }
  }

  private_ip_google_access = var.private_ip_google_access
  private_ipv6_google_access = var.private_ipv6_google_access
  region = var.region

  dynamic "log_config" {
    for_each = var.log_config
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling = log_config.value.flow_sampling
      metadata = log_config.value.metadata
      metadata_fields = log_config.value.metadata_fields
      filter_expr = log_config.value.filter_expr
    }
  }

}