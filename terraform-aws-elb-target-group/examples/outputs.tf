output "alb_target_group_443_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.alb_target_group_443.lb_target_group_arn
}

output "alb_target_group_80_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.alb_target_group_80.lb_target_group_arn
}

output "nlb_target_group_443_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.nlb_target_group_443.lb_target_group_arn
}

output "nlb_target_group_80_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = module.nlb_target_group_80.lb_target_group_arn
}