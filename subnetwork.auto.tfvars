subnetwork = {
  environments = {
    production = {
      ip_cidr_range = "10.0.0.0/16"
      purpose = "PRIVATE"
      region = "us-central1"
      subnetwork_name = "kubernetes-network"
      secondary_ip_range = [
        {
          range_name = "pods-network"
          ip_cidr_range = "10.96.0.0/14"
        },
        {
          range_name = "services-network"
          ip_cidr_range = "10.40.0.0/14"
        }]
      log_config = []
    }
  }
}