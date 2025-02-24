output "alb_target_group_443_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.alb_target_group_443.lb_target_group_arn
}

# output "alb_target_group_80_arn" {
#   description = "The ARN of the load balancer target group created by this module."
#   value       = module.alb_target_group_80.lb_target_group_arn
# }

output "nlb_target_group_443_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.nlb_target_group_443.lb_target_group_arn
}

# output "nlb_target_group_80_arn" {
#   description = "The ARN of the load balancer target group created by this module."
#   value       = module.nlb_target_group_80.lb_target_group_arn
# }

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
