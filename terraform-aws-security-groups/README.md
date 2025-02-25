<!-- BEGIN_TF_DOCS -->

# AWS Security Group Terraform module

Terraform module which creates Security Group, Ingress and Egress Rule resources in AWS

## Usage
```hcl
module "security_group" {
  source = "../"

  security_group_name        = "Test Security Group"
  security_group_description = "This is a test security group."
  ingress_rules = {
    rule_1 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow HTTP Traffic"
      from_port        = 80
      ip_protocol      = "tcp"
      to_port          = 80
    },
    rule_2 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow SSH Traffic"
      from_port        = 22
      ip_protocol      = "tcp"
      to_port          = 22
    },
    rule_3 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow ICMP Traffic"
      from_port        = -1
      ip_protocol      = "icmp"
      to_port          = -1
    },
    rule_4 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow HTTPS Traffic"
      from_port        = 443
      ip_protocol      = "tcp"
      to_port          = 443
    }
  }
  egress_rules = {
    rule_1 = {
      cidr_ipv4        = "0.0.0.0/0"
      rule_description = "Allow All Traffic"
      from_port        = -1
      ip_protocol      = "-1"
      to_port          = -1
    }
  }
  vpc_id = var.vpc_id
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
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC to create the security group in. | `string` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A map of egress rules to add to the security group. | <pre>map(object({<br>    cidr_ipv4                    = optional(string)<br>    rule_description             = optional(string)<br>    from_port                    = optional(number)<br>    ip_protocol                  = string<br>    prefix_list_id               = optional(string)<br>    referenced_security_group_id = optional(string)<br>    to_port                      = optional(number)<br>  }))</pre> | `{}` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A map of ingress rules to add to the security group. | <pre>map(object({<br>    cidr_ipv4                    = optional(string)<br>    rule_description             = optional(string)<br>    from_port                    = optional(number)<br>    ip_protocol                  = string<br>    prefix_list_id               = optional(string)<br>    referenced_security_group_id = optional(string)<br>    to_port                      = optional(number)<br>  }))</pre> | `{}` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The description of the security group. | `string` | `null` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group. | `string` | `null` | no |
| <a name="input_security_group_name_prefix"></a> [security\_group\_name\_prefix](#input\_security\_group\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group. |

<!-- END_TF_DOCS -->