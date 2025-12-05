output "vm_instances" {
  description = "Details of the created VM instances"
  value = {
    for idx, vm in google_compute_instance.rhel9_vms : vm.name => {
      id           = vm.id
      name         = vm.name
      machine_type = vm.machine_type
      zone         = vm.zone
      internal_ip  = vm.network_interface[0].network_ip
      external_ip  = vm.network_interface[0].access_config[0].nat_ip
      self_link    = vm.self_link
    }
  }
}

output "vm_names" {
  description = "Names of the created VMs"
  value       = [for vm in google_compute_instance.rhel9_vms : vm.name]
}

output "vm_external_ips" {
  description = "External IP addresses of the VMs"
  value       = [for vm in google_compute_instance.rhel9_vms : vm.network_interface[0].access_config[0].nat_ip]
}

output "vm_internal_ips" {
  description = "Internal IP addresses of the VMs"
  value       = [for vm in google_compute_instance.rhel9_vms : vm.network_interface[0].network_ip]
}
