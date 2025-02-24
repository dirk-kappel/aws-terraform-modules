<!-- BEGIN_TF_DOCS -->

# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

# Usage

```hcl
module "sns" {
  source = "../"

  name              = "example-topic"
  display_name      = "This is an example sns topic."
  fifo_topic        = false
  kms_master_key_id = "alias/aws/sns"
  protocol          = "email"
}
```


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |



## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the topic. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the SNS topic. | `string` | `""` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | Set to true to create a FIFO topic. | `bool` | `false` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. | `string` | `"alias/aws/sns"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol you want to use. Supported protocols include: http, https, email, email-json, sms, sqs, application, lambda. Protocols email, email-json, http and https are also valid but partially supported. | `string` | `"email"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic_id"></a> [sns\_topic\_id](#output\_sns\_topic\_id) | The ARN of the SNS topic |

# Author
Dirk Kappel

# License
<!-- END_TF_DOCS -->