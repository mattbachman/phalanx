# Phalanx

Terraform configuration to deploy two RHEL 9 virtual machines in Google Cloud Platform (GCP).

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [GCP Account](https://cloud.google.com/) with billing enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and configured
- Appropriate GCP permissions to create compute instances

## Authentication

Before running Terraform, authenticate with GCP:

```bash
gcloud auth application-default login
```

## Configuration

1. Copy the example variables file:
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Edit `terraform.tfvars` and set your GCP project ID:
```hcl
project_id = "your-gcp-project-id"
```

3. (Optional) Customize other variables:
   - `region`: GCP region (default: us-central1)
   - `zone`: GCP zone (default: us-central1-a)
   - `vm_names`: Names for the VMs (default: ["rhel9-vm-1", "rhel9-vm-2"])
   - `machine_type`: Machine type (default: e2-medium)
   - `boot_disk_size`: Boot disk size in GB (default: 20)
   - `tags`: Network tags (default: ["rhel9", "web"])

## Usage

### Initialize Terraform
```bash
terraform init
```

### Plan the deployment
```bash
terraform plan
```

### Deploy the VMs
```bash
terraform apply
```

### View outputs
```bash
terraform output
```

### Destroy the infrastructure
```bash
terraform destroy
```

## Resources Created

- 2 x Google Compute Engine instances running RHEL 9
- Each instance has:
  - Boot disk with RHEL 9 image
  - Ephemeral external IP address
  - Internal IP address
  - OS Login enabled

## Outputs

After deployment, Terraform will output:
- `vm_instances`: Detailed information about each VM
- `vm_names`: List of VM names
- `vm_external_ips`: External IP addresses for SSH access
- `vm_internal_ips`: Internal IP addresses

## Connecting to VMs

Connect to the VMs using SSH:

```bash
gcloud compute ssh <vm-name> --zone=<zone>
```

Or use the external IP with OS Login:

```bash
gcloud compute ssh <username>@<external-ip>
```

## Cost Considerations

These VMs will incur charges while running. The default `e2-medium` instance type provides:
- 2 vCPUs
- 4 GB memory
- 20 GB boot disk

Estimated cost: ~$25-30 per VM per month (varies by region and usage).

## License

See [LICENSE.md](LICENSE.md) for details.
