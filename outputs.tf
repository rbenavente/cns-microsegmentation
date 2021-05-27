# Author - Alexandre S. Cezar

output "instance_bastion_public_ip" {
  value = google_compute_instance.bastion.network_interface.0.access_config.0.nat_ip
}

output "instance_wordpress_public_ip" {
  value = google_compute_instance.wordpress.network_interface.0.access_config.0.nat_ip
}

output "instance_mariadb_public_ip" {
  value = google_compute_instance.mariadb.network_interface.0.access_config.0.nat_ip
}

output "instance_mariadb_internal_ip" {
  value = google_compute_instance.mariadb.network_interface.0.network_ip
}

output "gke_client_certificate" {
  value     = google_container_cluster.gke.master_auth.0.client_certificate
  sensitive = true
}

output "gke_client_key" {
  value     = google_container_cluster.gke.master_auth[0].client_key
  sensitive = true
}

output "gke_cluster_ca_certificate" {
  value     = google_container_cluster.gke.master_auth.0.cluster_ca_certificate
  sensitive = true
}

output "gke_host" {
  value     = google_container_cluster.gke.endpoint
}