output "policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = aws_iam_policy.this.arn
}

output "policy_id" {
  description = "The Policy's ID."
  value       = aws_iam_policy.this.policy_id
}

output "policy_json" {
  description = "The policy document."
  value       = data.aws_iam_policy_document.this.json
}