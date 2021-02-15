data "google_container_engine_versions" "cluster-version" {
  location = var.location
  version_prefix = var.version_prefix
}

resource "google_container_cluster" "master" {
  name = var.cluster_name
  location = var.location
  min_master_version = data.google_container_engine_versions.cluster-version.version_prefix
  network = var.vpc_id
  subnetwork = var.subnetwork_id

  dynamic "addons_config" {
    for_each = var.addons_config
    content {
      horizontal_pod_autoscaling {
        disabled = addons_config.value.horizontal_pod_autoscaling
      }
      http_load_balancing {
        disabled = addons_config.value.http_load_balancing
      }

      network_policy_config {
        disabled = addons_config.value.network_policy_config
      }

      cloudrun_config {
        disabled = addons_config.value.cloudrun_config
      }
    }
  }

  dynamic "network_policy" {
    for_each = var.network_policy
    content {
      enabled = network_policy.value.enabled
      provider = network_policy.value.provider
    }
  }

  dynamic "ip_allocation_policy" {
    for_each = var.ip_allocation_policy
    content {
      cluster_secondary_range_name = ip_allocation_policy.value.cluster_secondary_range_name
      services_secondary_range_name = ip_allocation_policy.value.services_secondary_range_name
    }
  }

  dynamic "node_pool" {
    for_each = var.node_pool
    content {
      name = node_pool.value.node_pool_name
      max_pods_per_node = node_pool.value.max_pods_per_node
      node_count = node_pool.value.node_count
      node_config {
        preemptible = node_pool.value.node_config.preemptible
        machine_type = node_pool.value.node_config.machine_type
        disk_size_gb = node_pool.value.node_config.disk_size_gb
        disk_type = node_pool.value.node_config.disk_type
        image_type = node_pool.value.node_config.image_type
      }
    }
  }
    }