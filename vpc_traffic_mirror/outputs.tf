output "mirror_session_arn" {
  description = "The ARN of the traffic mirror session."
  value       = aws_ec2_traffic_mirror_session.session.arn
}

output "mirror_filter_arn" {
  description = "The ARN of the traffic mirror filter."
  value       = aws_ec2_traffic_mirror_filter.filter.arn
}

output "traffic_mirror_target_id" {
  description = "The ID of the Traffic Mirror target."
  value       = try(aws_ec2_traffic_mirror_target.eni[0].id, aws_ec2_traffic_mirror_target.nlb[0].id, aws_ec2_traffic_mirror_target.gwlb[0].id)
}
