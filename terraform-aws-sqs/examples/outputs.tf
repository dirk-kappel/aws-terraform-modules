output "sqs_arn" {
  value       = module.sqs.sqs_arn
  description = "The ARN of the SQS queue."
}

output "sqs_id" {
  value       = module.sqs.sqs_id
  description = "URL for the created Amazon SQS queue."
}