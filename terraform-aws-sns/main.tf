#--------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/sns/latest/dg/sns-dg.pdf
#
#--------------------------------------------------


#--------------------------------------------------
#
# SNS TOPIC
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
#
#-------------------------------------------------- 

resource "aws_sns_topic" "this" {
  name              = var.name
  name_prefix       = var.name_prefix
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  fifo_topic        = var.fifo_topic

  tags = {
    Name = var.name
  }
}

#--------------------------------------------------
#
# SNS TOPIC POLICY
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy
#
#--------------------------------------------------

resource "aws_sns_topic_policy" "this" {
  count = var.create_sns_topic_policy == true ? 1 : 0

  arn    = aws_sns_topic.this.arn
  policy = var.sns_topic_policy_json
}
