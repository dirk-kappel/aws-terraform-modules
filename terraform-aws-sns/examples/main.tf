module "sns" {
  source = "../"

  name                    = "example-topic"
  display_name            = "This is an example sns topic."
  kms_master_key_id       = "alias/aws/sns"
  protocol                = "email"
  sns_topic_policy_json   = data.aws_iam_policy_document.aws_iam_policy_document.json
  create_sns_topic_policy = true
}

data "aws_iam_policy_document" "aws_iam_policy_document" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      module.sns.sns_topic_id,
    ]

    sid = "__default_statement_ID"
  }
}