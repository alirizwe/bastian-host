#Data source for existing SSH key-pair on AWS
data "aws_key_pair" "ssh-key" {
  key_name           = var.existing_key_name
}

# Data source for latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}