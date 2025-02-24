output "mirror_session_arn" {
  description = "The ARN of the traffic mirror session."
  value       = module.vpc_traffic_mirror.mirror_session_arn
}

output "mirror_filter_arn" {
  description = "The ARN of the traffic mirror filter."
  value       = module.vpc_traffic_mirror.mirror_filter_arn
}

output "traffic_mirror_target_id" {
  description = "The ID of the Traffic Mirror target."
  value       = module.vpc_traffic_mirror.traffic_mirror_target_id
}