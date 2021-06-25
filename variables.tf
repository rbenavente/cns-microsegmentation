# Author - Alexandre S. Cezar

variable "project_name" {
  type        = string
  description = "Microsegmentation class project ID."
  default     = ""
}

variable "region_name" {
  type        = string
  description = "The Region name used in this project."
  default     = "us-east1"
}

variable "zone_name" {
  type        = string
  description = "The Zone name used in this project."
  default     = "us-east1-c"
}

variable "bastion_machine_size" {
  type        = string
  description = "Bastion instance size"
  default     = "g1-small"
}

variable "wordpress_machine_size" {
  type        = string
  description = "Wordpress instance size"
  default     = "n1-standard-1"
}

variable "mariadb_machine_size" {
  type        = string
  description = "MariaDB instance size"
  default     = "g1-small"
}

variable "gke_machine_size" {
  type        = string
  description = "GKE instance size"
  default     = "e2-medium"
}

variable "image_name" {
  type        = string
  description = "VM image name"
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "private_key_path" {
  type        = string
  description = "The path to the SSH private key used to connect to the instances"
  default     = ""
}

variable "username" {
  type        = string
  description = "The name of the SSH user that will be used to connect to the instances"
  default     = ""
}

variable "gke_num_nodes" {
  default     = 4
  description = "number of gke nodes"
}

variable "folder_scripts" {
  type        = string
  description = "The path to the scripts folder"
  default = ""
}

variable "path_service_account" {
  type        = string
  description = "The path to the terraform.json file"
  default = ""
}