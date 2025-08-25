module "sqs" {
  source = "../"

  name                      = "example-sqs"
  kms_master_key_id         = "alias/aws/sqs"
  message_retention_seconds = 3600
}

