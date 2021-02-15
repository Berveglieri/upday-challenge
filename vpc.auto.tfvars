vpc = {
  environments = {
    production = {
      auto_create_subnets = false
      routing_mode        = "REGIONAL"
      vpc_network_name    = "main-vpc"
    }
  }
}