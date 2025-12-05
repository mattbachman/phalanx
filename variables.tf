variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_names" {
  description = "Names for the VM instances"
  type        = list(string)
  default     = ["rhel9-vm-1", "rhel9-vm-2"]
}

variable "machine_type" {
  description = "Machine type for the VM instances"
  type        = string
  default     = "e2-medium"
}

variable "network" {
  description = "Network to attach the VMs to"
  type        = string
  default     = "default"
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Network tags for the VM instances"
  type        = list(string)
  default     = ["rhel9", "web"]
}
