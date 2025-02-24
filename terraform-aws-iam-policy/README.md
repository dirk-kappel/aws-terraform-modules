<!-- BEGIN_TF_DOCS -->

# AWS IAM Role Terraform module

Terraform module which creates IAM Role resources in AWS

## Usage
```hcl
module "iam_policy" {
  source = "../"

  name        = "Module_Test_Policy"
  description = "Test policy with allows"
  path        = "/test/"
  statements = [
    {
      actions = [
        "logs:CreateLogGroup",
        "ec2:DescribeAddressesAttribute",
        "rds:CreateDBSubnetGroup",
        "iam:CreateRole"
      ]
      effect    = "Allow"
      resources = ["*"]
    },
    {
      actions = [
        "sns:*"
      ]
      effect    = "Deny"
      resources = ["*"]
    }
  ]
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_statements"></a> [statements](#input\_statements) | IAM policy as list of Terraform objects, compatible with Terraform `aws_iam_policy_document` data source<br>except that `source_policy_documents` and `override_policy_documents` are not included.<br>Use inputs `iam_source_policy_documents` and `iam_override_policy_documents` for that. | <pre>list(object({<br>    sid           = optional(string, null)<br>    effect        = optional(string, null)<br>    actions       = optional(list(string), null)<br>    not_actions   = optional(list(string), null)<br>    resources     = optional(list(string), null)<br>    not_resources = optional(list(string), null)<br>    conditions = optional(list(object({<br>      test     = string<br>      variable = string<br>      values   = list(string)<br>    })), [])<br>    principals = optional(list(object({<br>      type        = string<br>      identifiers = list(string)<br>    })), [])<br>    not_principals = optional(list(object({<br>      type        = string<br>      identifiers = list(string)<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the created IAM policy. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the role. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide. | `string` | `"/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of resource tags. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | The ARN assigned by AWS to this policy. |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The Policy's ID. |
### Footer
<!-- END_TF_DOCS -->