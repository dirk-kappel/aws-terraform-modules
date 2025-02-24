output "gateway_endpoints" {
  description = "A map of the VPC endpoints created by this module."
  value       = module.vpc_endpoints.gateway_endpoints
}

output "interface_endpoints" {
  description = "A map of the VPC endpoints created by this module."
  value       = module.vpc_endpoints.interface_endpoints
}
