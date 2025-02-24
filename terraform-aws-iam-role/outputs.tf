output "instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile."
  value       = try(aws_iam_instance_profile.this[0].arn, null)
}

output "instance_profile_id" {
  description = "ID of the instance profile."
  value       = try(aws_iam_instance_profile.this[0].id, null)
}

output "role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.this.arn
}

output "role_id" {
  description = "The ID of the role."
  value       = aws_iam_role.this.id
}

output "role_name" {
  description = "Name of the role."
  value       = aws_iam_role.this.name
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = aws_iam_role.this.unique_id
}
