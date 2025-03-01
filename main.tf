# Security Group for Bastion Host
resource "aws_security_group" "bastion" {
  name_prefix = "bastion-sg-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# SSH Key Pair for Bastion Host if create_new_key_pair is true
resource "aws_key_pair" "bastian_key" {
    count = var.create_new_key_pair ? 1 : 0
    key_name = "bastian-host-key"
    public_key = file(var.public_key_path)

}

# Bastion Host EC2 Instance
resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name               = var.create_new_key_pair ? aws_key_pair.bastian_key[0].key_name : data.aws_key_pair.ssh-key.key_name
}