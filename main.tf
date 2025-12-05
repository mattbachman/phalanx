# Get the latest RHEL 9 image
data "google_compute_image" "rhel9" {
  family  = "rhel-9"
  project = "rhel-cloud"
}

# Create two RHEL 9 VM instances
resource "google_compute_instance" "rhel9_vms" {
  count        = 2
  name         = var.vm_names[count.index]
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = data.google_compute_image.rhel9.self_link
      size  = var.boot_disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network = var.network

    access_config {
      # Ephemeral public IP
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  lifecycle {
    create_before_destroy = true
  }
}
