output "instance_arn" {
  description = "The ARN of the instance."
  value       = module.ec2.instance_arn
}

output "instance_id" {
  description = "The ID of the instance."
  value       = module.ec2.instance_id
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface."
  value       = module.ec2.primary_network_interface_id
}

output "public_dns" {
  description = "The public DNS associated with the elastic IP address, if applicable."
  value       = module.ec2.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the elastic IP, if applicable."
  value       = module.ec2.public_ip
}
