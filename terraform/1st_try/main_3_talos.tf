terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.1.58:8006/api2/json"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "talos2" {
    bios                   = "seabios"
    boot                   = "order=scsi0;ide2;net0"
    hotplug                = "network,disk,usb"
    target_node            = "pve"
    kvm                    = true
    memory                 = 2048
    name                   = "talos2"
    qemu_os                = "l26"
    scsihw                 = "virtio-scsi-pci"
    tablet                 = true
    vmid                   = 101

    cpu {
        cores    = 2
        sockets  = 1
        type     = "host"
    }

    disks {
        ide {
            ide2 {
                cdrom {
                    iso         = "local:iso/metal-amd64.iso"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    format               = "raw"
                    iothread             = false
                    size                 = "32G"
                    storage              = "local-lvm"
                }
            }
        }
    }

    network {
        bridge    = "vmbr0"
        firewall  = false
        id        = 0
        macaddr   = "bc:24:11:d1:d3:d7"
        model     = "virtio"
    }
}