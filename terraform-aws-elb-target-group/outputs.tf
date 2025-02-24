output "lb_target_group_arn" {
  description = "The ARN of the load balancer target group created by this module."
  value       = aws_lb_target_group.this.arn
}