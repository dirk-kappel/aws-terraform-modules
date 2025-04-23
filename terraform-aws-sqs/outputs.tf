output "sqs_arn" {
  value       = aws_sqs_queue.this.arn
  description = "The ARN of the SQS queue."
}

output "sqs_id" {
  value       = aws_sqs_queue.this.id
  description = "URL for the created Amazon SQS queue."
}