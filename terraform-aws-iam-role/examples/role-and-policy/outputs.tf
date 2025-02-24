#--------------------------------------------------
# NETWORK
#--------------------------------------------------

output "example_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = module.tfc_example_role.role_arn
}

output "example_role_name" {
  description = "Name of the role."
  value       = module.tfc_example_role.role_name
}

output "example_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.tfc_example_role.role_unique_id
}

output "example_policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = module.tfc_example_policy.policy_arn
}

output "example_policy_id" {
  description = "The Policy's ID."
  value       = module.tfc_example_policy.policy_id
}
