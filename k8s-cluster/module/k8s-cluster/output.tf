output "cluster_id" {
  value = google_container_cluster.master.id
}

output "cluster_nodes" {
  value = google_container_cluster.master.node_pool
}