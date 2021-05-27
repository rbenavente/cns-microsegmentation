# Author - Alexandre S. Cezar

# Creates the VPC
resource "google_compute_network" "vpc" {
  name                    = var.project_name
  auto_create_subnetworks = "false"
}

# Configure the Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.project_name
  region        = var.region_name
  network       = google_compute_network.vpc.name
  ip_cidr_range = "192.168.120.0/24"
}

# Create the Google Firewall Policies for the Bastion instance
resource "google_compute_firewall" "bastion-ssh" {
  name    = "allow-ssh-bastion"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Allow traffic from anywhere to instances with a bastion tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bastion"]

  depends_on = [google_compute_network.vpc]
}

# Create the Google Firewall Policies for the Wordpress instance
resource "google_compute_firewall" "wordpress-http" {
  name    = "allow-http-wordpress"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["wordpress"]

  depends_on = [google_compute_network.vpc]
}

resource "google_compute_firewall" "wordpress-ssh" {
  name    = "allow-ssh-wordpress"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["wordpress"]

  depends_on = [google_compute_network.vpc]
}

# Create the Google Firewall Policies for the MariaDB instance
resource "google_compute_firewall" "mariadb-ssh" {
  name    = "allow-ssh-mariadb"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mariadb"]

  depends_on = [google_compute_network.vpc]
}

# Create the Google Firewall Policies for the internal subnet to communicate
resource "google_compute_firewall" "allow-internal-all-inbound" {
  name    = "allow-subnet-all-in"
  network = var.project_name
  priority = 1000

  allow {
    protocol = "all"
  }

  source_ranges = ["192.168.120.0/24"]

  depends_on = [google_compute_network.vpc]
}

resource "google_compute_firewall" "allow-internal-all-outbound" {
  direction = "EGRESS"
  name    = "allow-subnet-all-out"
  network = var.project_name
  priority = 1000

  allow {
    protocol = "all"
  }

  destination_ranges = ["192.168.120.0/24"]

  depends_on = [google_compute_network.vpc]
}