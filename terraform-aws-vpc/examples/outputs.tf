output "cloud_watch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group created by this module."
  value       = module.vpc.cloud_watch_log_group_arn
}

output "default_nacl_id" {
  description = "The ID of the default nacl created by this module."
  value       = module.vpc.default_nacl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table created by this module."
  value       = module.vpc.default_route_table_id
}

output "default_security_group_id" {
  description = "The ID of the default security group created by this module."
  value       = module.vpc.default_security_group_id
}

output "dhcp_options_arn" {
  description = "The ARN of the DHCP options set created by the module."
  value       = module.vpc.dhcp_options_arn
}

output "dhcp_options_id" {
  description = "The ID of the DHCP options set created by the module."
  value       = module.vpc.dhcp_options_id
}

output "eip_allocation_ids" {
  description = "The EIP allocation IDs created by the module."
  value       = module.vpc.eip_allocation_ids
}

output "flow_log_id" {
  description = "The ID of the flow log created by this module."
  value       = module.vpc.flow_log_id
}

output "internet_gateway_arn" {
  description = "The ARN of the internet gateway created by the module."
  value       = module.vpc.internet_gateway_arn
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway created by the module."
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT gateways created by the module."
  value       = module.vpc.nat_gateway_ids
}

output "route_tables" {
  description = "The route tables created by the module."
  value       = module.vpc.route_tables
}

output "private_subnets" {
  description = "The private subnets created by the module."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "The public subnets created by the module."
  value       = module.vpc.public_subnets
}

output "vpc_arn" {
  description = "The ARN of the VPC created by the module."
  value       = module.vpc.vpc_arn
}

output "vpc_id" {
  description = "The ID of the VPC created by the module."
  value       = module.vpc.vpc_id
}
