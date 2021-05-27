# Author - Alexandre S. Cezar

variable "project_name" {
  type        = string
  description = "Microsegmentation class project name."
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

variable "script_path_bastion" {
  type        = string
  description = "The path to the bastion.sh script"
  default = ""
}

variable "script_path_wordpress" {
  type        = string
  description = "The path to the wordpress.sh script"
  default = ""
}

variable "script_path_mariadb" {
  type        = string
  description = "The path to the mariadb.sh script"
  default = ""
}

variable "script_path_k8s" {
  type        = string
  description = "The path to the k8s.sh script"
  default = ""
}

variable "script_path_create_db" {
  type        = string
  description = "The path to the create_db script"
  default = ""
}

variable "yaml_path_sock-shop" {
  type        = string
  description = "The path to the Sock-Shop yaml file"
  default = ""
}

variable "yaml_path_guestbook" {
  type        = string
  description = "The path to the Guestbook yaml file"
  default = ""
}

variable "yaml_path_rogue" {
  type        = string
  description = "The path to the Rogue yaml file"
  default = ""
}

variable "yaml_path_victim" {
  type        = string
  description = "The path to the Victim yaml file"
  default = ""
}

variable "path_service_account" {
  type        = string
  description = "The path to the terraform.json file"
  default = ""
}