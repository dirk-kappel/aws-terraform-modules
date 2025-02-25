<!-- BEGIN_TF_DOCS -->

# AWS SNS TOPIC Terraform module

Terraform module which creates SNS Topic and Policy resources in AWS

## Usage
```hcl
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
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sns_topic_policy"></a> [create\_sns\_topic\_policy](#input\_create\_sns\_topic\_policy) | Whether to create an sns topic policy or not. | `bool` | `false` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the SNS topic. | `string` | `null` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | Boolean indicating whether or not to create a FIFO (first-in-first-out) topic. <br>FIFO topics can't deliver messages to customer managed endpoints, such as email addresses, mobile apps, SMS, or HTTP(S) endpoints. <br>These endpoint types aren't guaranteed to preserve strict message ordering. | `bool` | `false` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. | `string` | `"alias/aws/sns"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, <br>numbers, underscores, and hyphens, and must be between 1 and 256 characters long. <br>For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. <br>If omitted, Terraform will assign a random, unique name. Conflicts with name\_prefix. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol you want to use. Supported protocols include: http, https, email, email-json, sms, sqs, application, lambda. <br>Protocols email, email-json, http and https are also valid but partially supported. | `string` | `"email"` | no |
| <a name="input_sns_topic_policy_json"></a> [sns\_topic\_policy\_json](#input\_sns\_topic\_policy\_json) | The fully-formed AWS policy as JSON. | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic_id"></a> [sns\_topic\_id](#output\_sns\_topic\_id) | The ARN of the SNS topic |

<!-- END_TF_DOCS -->