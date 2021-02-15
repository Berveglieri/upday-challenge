k8s-config = {
  environments = {
    production = {
      cluster_name = "main-k8s-cluster"
      location = "us-central1"
      version_prefix = "1.17.14-gke.400"
      addons_config = [{
        horizontal_pod_autoscaling = true
        http_load_balancing = true
        network_policy_config = false
        cloudrun_config = false
      }]

      network_policy = [{
        enabled = true
        provider = "CALICO"
      }]

      ip_allocation_policy = [
        {
          cluster_secondary_range_name = "pods-network"
          services_secondary_range_name = "services-network"
        }
      ]

      node_pools = [
        {
        node_pool_name = "main-k8s-pool"
        max_pods_per_node = 110
        location = "us-central1"
        node_count = 1
        node_config = {
          preemptible = true
          machine_type = "e2-medium"
          disk_size_gb = 100
          disk_type = "pd-standard"
          image_type = "cos_containerd"
        }
      }
      ]
    }
  }
}