# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dg.pdf
#
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
#
# DynamoDB Table
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
#
# ----------------------------------------------------------------------------------------------------

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name     = var.name
  hash_key = var.hash_key
  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  range_key      = var.range_key

  dynamic "ttl" {
    for_each = var.ttl
    content {
      enabled        = ttl.value.enabled
      attribute_name = ttl.value.attribute_name
    }
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = var.tags
}

# ----------------------------------------------------------------------------------------------------
#
# SQS QUE POLICY
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy
#
# ----------------------------------------------------------------------------------------------------


