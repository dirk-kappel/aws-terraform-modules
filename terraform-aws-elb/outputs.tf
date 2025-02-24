output "lb_arn" {
  description = "The ARN of the load balancer created by this module."
  value       = try(aws_lb.network[0].arn, aws_lb.application[0].arn)
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer created by this module."
  value       = try(aws_lb.network[0].dns_name, aws_lb.application[0].dns_name)
}

output "lb_zone_id" {
  description = "The zone ID of the load balancer created by this module."
  value       = try(aws_lb.network[0].zone_id, aws_lb.application[0].zone_id)
}
