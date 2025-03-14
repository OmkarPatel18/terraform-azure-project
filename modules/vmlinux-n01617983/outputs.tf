output "linux_vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.name]
}

output "linux_vm_private_ips" {
  value = [for nic in azurerm_network_interface.linux_nic : nic.private_ip_address]
}

output "linux_vm_public_ips" {
  value = [for pip in azurerm_public_ip.linux_pip : pip.ip_address]
}

output "vm_ids" {
  value = { for idx, vm in azurerm_linux_virtual_machine.linux_vm : idx => vm.id }
}

output "vm_nics" {
  value = { for idx, nic in azurerm_network_interface.linux_nic : idx => nic.id }
}
