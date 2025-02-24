output "cloud_watch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group created by this module."
  value       = try(aws_cloudwatch_log_group.this[0].arn, null)
}

output "default_nacl_id" {
  description = "The ID of the default NACL created by this module."
  value       = aws_vpc.this.default_network_acl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table created by this module."
  value       = aws_vpc.this.default_route_table_id
}

output "default_security_group_id" {
  description = "The ID of the default security group created by this module."
  value       = aws_vpc.this.default_security_group_id
}

output "dhcp_options_arn" {
  description = "The ARN of the DHCP options set created by this module."
  value       = try(aws_vpc_dhcp_options.this[0].arn, null)
}

output "dhcp_options_id" {
  description = "The ID of the DHCP options set created by this module."
  value       = try(aws_vpc_dhcp_options.this[0].id, null)
}

output "eip_allocation_ids" {
  value       = { for k, v in aws_eip.nat_gateway : k => v.id }
  description = "Allocation IDs of the EIPs created for NAT Gateways"
}

output "flow_log_id" {
  description = "The IDs of the flow logs created by this module."
  value       = try(aws_flow_log.this[0].id, null)
}

output "internet_gateway_arn" {
  description = "The ARN of the internet gateway created by this module."
  value       = try(aws_internet_gateway.this[0].arn, null)
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway created by this module."
  value       = try(aws_internet_gateway.this[0].id, null)
}

output "nat_gateway_ids" {
  value       = { for k, v in aws_nat_gateway.this : k => v.id }
  description = "IDs of the NAT Gateways created"
}

output "private_subnets" {
  description = "The private subnets created by this module."
  value = {
    for key, subnet in aws_subnet.private :
    key => {
      arn = subnet.arn
      id  = subnet.id
    }
  }
}

output "public_subnets" {
  description = "The public subnets created by this module."
  value = {
    for key, subnet in aws_subnet.public :
    key => {
      arn = subnet.arn
      id  = subnet.id
    }
  }
}

output "route_tables" {
  description = "The route tables created by this module."
  value = {
    for key, rt in aws_route_table.this :
    key => {
      arn = rt.arn
      id  = rt.id
    }
  }
}

output "vpc_arn" {
  description = "The ARN of the VPC created by this module."
  value       = aws_vpc.this.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC created by this module."
  value       = aws_vpc.this.cidr_block
}

output "vpc_id" {
  description = "The ID of the VPC created by this module."
  value       = aws_vpc.this.id
}

output "vpc" {
  description = "The VPC created by this module."
  value       = aws_vpc.this
}