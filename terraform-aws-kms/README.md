<!-- BEGIN_TF_DOCS -->

# AWS KMS Terraform module

Terraform module which creates AWS KMS resources.

# Usage

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


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |



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
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console. Defaults to 'Managed by Terraform'. | `string` | `"Managed by Terraform"` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to false. | `bool` | `true` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Specifies whether the KMS key is a multi-Region key. You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. You cannot create a multi-Region alias key or a multi-Region key in a custom key store. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | The ARN of the KMS alias created by this module. |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the KMS key created by this module. |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The ID of the KMS key created by this module. |

# Author
Dirk Kappel

# License
<!-- END_TF_DOCS -->