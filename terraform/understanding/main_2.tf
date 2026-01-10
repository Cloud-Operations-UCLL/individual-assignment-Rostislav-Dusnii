terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.1.29:8006/api2/json"
  pm_tls_insecure = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_pool" "test" {
  poolid = "terraform-test"
  comment = "Testing Terraform ↔ Proxmox connectivity"
}
