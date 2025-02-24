<!-- BEGIN_TF_DOCS -->

# AWS IAM Role Terraform module

Terraform module which creates IAM Role and Instance Profile resources in AWS.

## Usage
```hcl
module "iam_role" {
  source = "../"

  create_instance_profile   = true
  description               = "Allows EC2 instances to call AWS services on your behalf."
  custom_managed_policy_arn = []
  managed_policy_arns       = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration      = 3600
  name                      = "TestRole"
  trust_relationship = {
    actions = ["sts:AssumeRole"]
    conditions = [
      {
        test     = "StringEquals"
        variable = "ec2:ResourceTag/Name"
        values   = ["My Tag Value"]
      },
      {
        test     = "StringLike"
        variable = "ec2:ResourceTag/Name"
        values   = ["*production*"]
      }
    ]
    effect = "Allow"
    principals = [
      {
        type        = "Service"
        identifiers = ["ec2.amazonaws.com"]
      }
    ]
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_trust_relationship"></a> [trust\_relationship](#input\_trust\_relationship) | The trust relationship to apply to the role. | <pre>object({<br>    actions = optional(list(string), [])<br>    conditions = optional(list(object({<br>      test     = string<br>      variable = string<br>      values   = list(string)<br>    })), [])<br>    effect = optional(string, "")<br>    principals = optional(list(object({<br>      type        = string<br>      identifiers = list(string)<br>    })), [])<br>    resources = optional(list(string), [])<br>  })</pre> | n/a | yes |
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | The policy that grants an entity permission to assume the role. | `string` | `""` | no |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Whether to create an instance profile alongside the role. | `bool` | `false` | no |
| <a name="input_custom_managed_policy_arn"></a> [custom\_managed\_policy\_arn](#input\_custom\_managed\_policy\_arn) | Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed\_policy\_arns = []) will cause Terraform to remove all managed policy attachments. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the role. | `string` | `""` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Whether to force detaching any policies the role has before destroying it. Defaults to false. | `bool` | `false` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Terraform will not manage any inline policies in this resource. Configuring one empty block (i.e., inline\_policy {}) will cause Terraform to remove all inline policies added out of band on apply. | `string` | `""` | no |
| <a name="input_inline_policy_content"></a> [inline\_policy\_content](#input\_inline\_policy\_content) | Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Terraform will not manage any inline policies in this resource. Configuring one empty block (i.e., inline\_policy {}) will cause Terraform to remove all inline policies added out of band on apply. | `map(string)` | `{}` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed\_policy\_arns = []) will cause Terraform to remove all managed policy attachments. | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours. | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the role. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `""` | no |
| <a name="input_principal_service"></a> [principal\_service](#input\_principal\_service) | The value for the principal services in the assume role policy | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of resource tags. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | ARN assigned by AWS to the instance profile. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | The ID of the role. |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of the role. |
| <a name="output_role_unique_id"></a> [role\_unique\_id](#output\_role\_unique\_id) | The stable and unique string identifying the role. |
### Footer
<!-- END_TF_DOCS -->