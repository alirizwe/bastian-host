# AWS Bastion Host Terraform Configuration

This Terraform configuration sets up a secure bastion host (jump server) in AWS, allowing secure SSH access to private resources in a VPC.

## Architecture Overview

The configuration creates:
- A bastion host EC2 instance in a public subnet
- Security group for the bastion host with SSH access
- Optional new SSH key pair
- Uses Amazon Linux 2 as the base AMI

## Prerequisites

- Terraform >= 1.0.0
- AWS account and credentials configured
- Existing VPC with public subnet
- SSH key pair (existing or new)

## Usage

1. Clone this repository
2. Update the `terraform.tfvars` file with your values.
3. Initialize Terraform:
```bash
terraform init
```
4. Review the execution plan:
```bash
terraform plan
```
5. Apply the configuration:
```bash
terraform apply
```
## Clean Up

To destroy the infrastructure:
```bash
terraform destroy
```
