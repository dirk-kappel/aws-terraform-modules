output "instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile."
  value       = module.iam_role.instance_profile_arn
}

output "role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = module.iam_role.role_arn
}

output "role_id" {
  description = "The ID of the role."
  value       = module.iam_role.role_id
}

output "role_name" {
  description = "Name of the role."
  value       = module.iam_role.role_name
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.iam_role.role_unique_id
}
