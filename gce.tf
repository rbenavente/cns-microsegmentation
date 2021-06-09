# Author - Alexandre S. Cezar

# Create the GCE Bastion instance
resource "google_compute_instance" "bastion" {
  name         = "vm-bastion"
  machine_type = var.bastion_machine_size
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

  tags = ["bastion"]

  # Connect to the Bastion instance via Terraform and remotely executes the install script using SSH
  provisioner "file" {
    source      = "${var.folder_scripts}/bastion.sh"
    destination = "/tmp/bastion.sh"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/k8s.sh"
    destination = "/tmp/k8s.sh"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/guestbook.yaml"
    destination = "/tmp/guestbook.yaml"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/sock-shop.yaml"
    destination = "/tmp/sock-shop.yaml"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/rogue.yaml"
    destination = "/tmp/rogue.yaml"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/victim.yaml"
    destination = "/tmp/victim.yaml"
  }
  provisioner "file" {
    source      = var.path_service_account
    destination = "/tmp/terraform.json"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bastion.sh",
      "sudo chmod +x /tmp/k8s.sh"
    ]
  }
  connection {
    type = "ssh"
    host = google_compute_instance.bastion.network_interface[0].access_config.0.nat_ip
    user = var.username
    private_key = file(var.private_key_path)
  }
}

# Create the GCE Wordpress instance
resource "google_compute_instance" "wordpress" {
  name         = "vm-wordpress"
  machine_type = var.wordpress_machine_size
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

  tags = ["wordpress"]

  labels = {
    application = "wordpress",
    role = "frontend"
  }

  depends_on = [
    google_compute_instance.bastion
  ]

  # Connect to the Wordpress instance via Terraform and remotely executes the install script using SSH
  provisioner "file" {
    source      = "${var.folder_scripts}/wordpress.sh"
    destination = "/tmp/wordpress.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/wordpress.sh"
    ]
  }
  connection {
    type = "ssh"
    host = google_compute_instance.wordpress.network_interface[0].access_config.0.nat_ip
    user = var.username
    private_key = file(var.private_key_path)
  }
}

# Create the GCE MariaDB instance
resource "google_compute_instance" "mariadb" {
  name         = "vm-mariadb"
  machine_type = var.mariadb_machine_size
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

  tags = ["mariadb"]

  labels = {
    application = "wordpress",
    role = "backend"
  }

  depends_on = [
    google_compute_instance.wordpress
  ]

  # Connect to the MariaDB instance via Terraform and remotely executes the install script using SSH
  provisioner "file" {
    source      = "${var.folder_scripts}/mariadb.sh"
    destination = "/tmp/mariadb.sh"
  }
  provisioner "file" {
    source      = "${var.folder_scripts}/create_db.sql"
    destination = "/tmp/create_db.sql"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/mariadb.sh"
    ]
  }
  connection {
    type = "ssh"
    host = google_compute_instance.mariadb.network_interface[0].access_config.0.nat_ip
    user = var.username
    private_key = file(var.private_key_path)
  }
}