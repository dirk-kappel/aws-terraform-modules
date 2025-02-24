output "instance_arn" {
  description = "The ARN of the instance."
  value       = aws_instance.this.arn
}

output "instance_id" {
  description = "The ID of the instance."
  value       = aws_instance.this.id
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface."
  value       = aws_instance.this.primary_network_interface_id
}

output "public_dns" {
  description = "The public DNS associated with the elastic IP address, if applicable."
  value       = try(aws_eip.this[0].public_dns, null)
}

output "public_ip" {
  description = "The public IP address assigned to the elastic IP, if applicable."
  value       = try(aws_eip.this[0].public_ip, null)
}