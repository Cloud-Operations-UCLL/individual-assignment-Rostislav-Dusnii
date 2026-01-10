output "vm_id" {
  description = "Proxmox VM ID for the Talos node"
  value       = proxmox_vm_qemu.talos_node.vmid
}

output "vm_name" {
  description = "VM name"
  value       = proxmox_vm_qemu.talos_node.name
}

output "node" {
  description = "Proxmox node hosting the Talos VM"
  value       = proxmox_vm_qemu.talos_node.target_node
}