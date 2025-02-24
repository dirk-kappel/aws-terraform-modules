output "kms_alias_arn" {
  description = "The ARN of the KMS alias created by this module."
  value       = aws_kms_alias.this.arn
}

output "kms_key_arn" {
  description = "The ARN of the KMS key created by this module."
  value       = aws_kms_key.this.arn
}

output "kms_key_id" {
  description = "The ID of the KMS key created by this module."
  value       = aws_kms_key.this.id
}
