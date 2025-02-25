<!-- BEGIN_TF_DOCS -->

# AWS KMS Terraform module

Terraform module which creates KMS Key, Key Policy, and Key Alias resources in AWS

## Usage
```hcl
module "kms" {
  source = "../"

  description             = "Example kms key"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  key_alias               = "alias/myKeyAlias"
  multi_region            = false
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
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_alias"></a> [key\_alias](#input\_key\_alias) | The display name of the alias. The name must start with the word alias followed by a forward slash (alias/). | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting <br>period ends, AWS KMS deletes the KMS key. If you specify a value, <br>it must be between 7 and 30, inclusive. If you do not specify a <br>value, it defaults to 30. | `any` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console. Defaults to 'Managed by Terraform'. | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to false. | `bool` | `null` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Specifies whether the KMS key is a multi-Region key. You can create <br>a symmetric or asymmetric multi-Region key, and you can create a <br>multi-Region key with imported key material. You cannot create a <br>multi-Region alias key or a multi-Region key in a custom key store. | `bool` | `null` | no |
| <a name="input_rotation_period_in_days"></a> [rotation\_period\_in\_days](#input\_rotation\_period\_in\_days) | Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive). | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the object. | `map(any)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | The ARN of the KMS alias created by this module. |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the KMS key created by this module. |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The ID of the KMS key created by this module. |

<!-- END_TF_DOCS -->