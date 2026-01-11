variable "cluster_name" {
  type    = string
  default = "homelab"
}

variable "default_gateway" {
  type    = string
  default = "192.168.1.1"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "192.168.1.40"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "192.168.1.41"
}