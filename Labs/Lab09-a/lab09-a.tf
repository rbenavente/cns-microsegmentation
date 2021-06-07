# Create the GCE instance
  resource "google_compute_instance" "lab09" {
    name         = "vm-lab09"
    machine_type = "g1-small"
    zone         = var.zone_name

    boot_disk {
    initialize_params {
    image = var.image_name
    size = 20
    }
    }

    network_interface {
    network = google_compute_network.vpc.name
    subnetwork   = google_compute_subnetwork.subnet.id
    access_config {
    }
    }

    tags = ["lab09"]
  }

# Create the Google Firewall Policies for the lab09 instance
resource "google_compute_firewall" "lab09-ssh" {
  name = "allow-ssh-lab09"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "lab09"]
}

resource "google_compute_firewall" "allow-lab09-outbound-tcp" {
  direction = "EGRESS"
  name    = "allow-lab09-outbound-tcp"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports = [
      "80","443"]
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags = [
    "lab09"]
}

resource "google_compute_firewall" "allow-lab09-outbound-udp" {
  direction = "EGRESS"
  name    = "allow-lab09-outbound-udp"
  network = var.project_name
  priority = 200

  allow {
    protocol = "udp"
    ports = [
      "53"]
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags = [
    "lab09"]
}

resource "google_compute_firewall" "deny-lab09-outbound-prisma" {
  direction = "EGRESS"
  name    = "deny-lab09-outbound-prisma"
  network = var.project_name
  priority = 200

  deny {
    protocol = "all"
  }

  destination_ranges = ["3.131.177.126","3.134.230.159","3.23.199.55","54.174.94.231","52.86.60.186"]
  target_tags = [
    "lab09"]
}

# Generate the output with the instance public IP
output "instance_lab09_public_ip" {
  value = google_compute_instance.lab09.network_interface.0.access_config.0.nat_ip
}