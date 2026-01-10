terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_endpoint
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "talos_node" {
  name        = var.vm_name

  memory      = var.memory_mb

  scsihw = "virtio-scsi-pci"

  cpu {
    cores     = var.cpu_cores
    type      = "host"
  }

  # Disk based on Talos image
  disk {
    iso = var.talos_image
    storage = var.storage_pool
    size    = "${var.disk_gb}G"
    iothread = 0
  }

  # Network
  network {
    id = 0
    model  = "virtio"
    bridge = var.bridge
  }
}