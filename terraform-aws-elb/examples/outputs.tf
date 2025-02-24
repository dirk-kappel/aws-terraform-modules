output "network_load_balancer_arn" {
  description = "The ARN of the load balancer created by this module."
  value       = module.network_load_balancer.lb_arn
}

output "network_load_balancer_dns_name" {
  description = "The DNS name of the load balancer created by this module."
  value       = module.network_load_balancer.lb_dns_name
}

output "network_load_balancer_zone_id" {
  description = "The zone ID of the load balancer created by this module."
  value       = module.network_load_balancer.lb_zone_id
}

output "application_load_balancer_arn" {
  description = "The ARN of the load balancer created by this module."
  value       = module.application_load_balancer.lb_arn
}

output "application_load_balancer_dns_name" {
  description = "The DNS name of the load balancer created by this module."
  value       = module.application_load_balancer.lb_dns_name
}

output "application_load_balancer_zone_id" {
  description = "The zone ID of the load balancer created by this module."
  value       = module.application_load_balancer.lb_zone_id
}