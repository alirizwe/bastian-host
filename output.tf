output "bastion_public_ip" {
  value       = aws_instance.bastion.public_ip
  description = "Public IP address of the bastion host"
} 

output "bastian_sg_id"{
    value = aws_security_group.bastion.id
    description = "Bastion host security group ID which will be used to whitelist for SHH in the inbound of SG of the instances which will be connected through it."
}