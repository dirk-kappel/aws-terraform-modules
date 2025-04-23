# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dg.pdf
#
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
#
# SQS QUE
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue
#
# ----------------------------------------------------------------------------------------------------

resource "aws_sqs_queue" "this" {
  name                       = var.name
  name_prefix                = var.name_prefix
  delay_seconds              = var.delay_seconds
  fifo_queue                 = var.fifo_queue
  kms_master_key_id          = var.kms_master_key_id
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  sqs_managed_sse_enabled    = var.sqs_managed_sse_enabled
  tags                       = var.tags
  visibility_timeout_seconds = var.visibility_timeout_seconds
}

# ----------------------------------------------------------------------------------------------------
#
# SQS QUE POLICY
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy
#
# ----------------------------------------------------------------------------------------------------


