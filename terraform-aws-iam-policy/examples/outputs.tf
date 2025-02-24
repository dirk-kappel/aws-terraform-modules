output "policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = module.iam_policy.policy_arn
}

output "policy_id" {
  description = "The Policy's ID."
  value       = module.iam_policy.policy_id
}
