<!-- BEGIN_TF_DOCS -->

# AWS Security Group Terraform module

Terraform module which creates Security Group resources on AWS

# Usage
```hcl
module "security_group" {
  # source  = "app.terraform.io/dmk-tfc-setup-sandbox/security-groups/aws"
  # version = "1.0.0"
  source = "../"

  name        = "DEV SSM Inbound"
  description = "Allows inbound traffic from your instance on port 443"
  ingress_rules = {
    1 = {
      cidr_ipv4   = "172.32.0.0/16"
      description = ""
      from_port   = 80
      ip_protocol = "tcp"
      to_port     = 80
    },
    2 = {
      cidr_ipv4   = "172.32.0.0/16"
      description = ""
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
    },
    3 = {
      cidr_ipv4   = "172.32.0.0/16"
      description = ""
      from_port   = -1
      ip_protocol = "icmp"
      to_port     = -1
    },
    4 = {
      cidr_ipv4   = "172.32.0.0/16"
      description = ""
      from_port   = 443
      ip_protocol = "tcp"
      to_port     = 443
    }
  }
  egress_rules = {
    1 = {
      cidr_ipv4   = "0.0.0.0/0"
      description = ""
      from_port   = -1
      ip_protocol = "-1"
      to_port     = -1
    }
  }
  tags = {
    Name = "DEV SSM Inbound"
  }
  vpc_id = "vpc-0b6924b84579a6a83"
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A map of egress rules to add to the security group. | <pre>map(object({<br>    cidr_ipv4                    = optional(string)<br>    description                  = optional(string)<br>    from_port                    = optional(number)<br>    ip_protocol                  = optional(string)<br>    referenced_security_group_id = optional(string)<br>    to_port                      = optional(number)<br>  }))</pre> | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A map of ingress rules to add to the security group. | <pre>map(object({<br>    cidr_ipv4                    = optional(string)<br>    description                  = optional(string)<br>    from_port                    = optional(number)<br>    ip_protocol                  = optional(string)<br>    referenced_security_group_id = optional(string)<br>    to_port                      = optional(number)<br>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the security group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the security group. | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC to create the security group in. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the security group. | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the security group |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
### Footer
<!-- END_TF_DOCS -->