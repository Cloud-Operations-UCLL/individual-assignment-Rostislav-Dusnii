variable "proxmox_endpoint" {
  description = "Proxmox API endpoint, e.g. https://pve.example.com:8006/api2/json"
  type        = string
}

variable "vm_name" {
  description = "Name of the Talos node"
  type        = string
  default     = "talos-single"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 4096
}

variable "disk_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 40
}

variable "storage_pool" {
  description = "Proxmox storage ID to use for the disk"
  type        = string
  default     = "local-lvm"
}

variable "talos_image" {
  description = "Proxmox storage path to Talos disk image (e.g. local-lvm:iso/talos.raw)"
  type        = string
  default     = local:iso/metal-amd64.iso
}

variable "bridge" {
  description = "Proxmox network bridge (e.g. vmbr0)"
  type        = string
  default     = "vmbr0"
}