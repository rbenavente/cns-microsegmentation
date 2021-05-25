# Creates the GKE cluster
resource "google_container_cluster" "gke" {
  name     = "microsegmentation-gke"
  location = var.zone_name

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  network_policy {
    enabled = true
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Configure a Managed Node Pool
resource "google_container_node_pool" "nodes" {
  name       = "${google_container_cluster.gke.name}-node-pool"
  location   = var.region_name
  cluster    = google_container_cluster.gke.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
    ]

    labels = {
      env = var.project_name
    }

    machine_type = var.gke_machine_size
    tags         = ["gke-node", "${var.project_name}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}