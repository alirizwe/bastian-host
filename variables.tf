variable "region" {
    description = "AWS region"
    type = string
    default = "ap-southeast-1"  # Singapore region"  
}
variable "vpc_id" {
  description = "ID of the existing Public VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet where bastion host will be launched"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to connect to bastion host via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "EC2 instance type for bastion host"
  type        = string
  default     = "t2.micro"
}

variable "create_new_key_pair" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}
variable "public_key_path"{
    description = "public key path"
    type = string
}

variable "existing_key_name" {
  description = "Name of the existing SSH key pair to use"
  type        = string
}