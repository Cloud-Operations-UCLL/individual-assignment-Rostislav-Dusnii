terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  # can be empty here; the module has its own provider config if you prefer
}

module "talos_single_node" {
  source = "../../modules/talos-single-node"

  proxmox_endpoint      = "https://192.168.1.58:8006/api2/json"
  vm_name               = "talos-cp-1"
}