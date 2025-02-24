<!-- BEGIN_TF_DOCS -->

# AWS VPC Terraform module

Terraform module which creates VPC resources in AWS

## Usage
```hcl
module "vpc" {
  source = "../"

  create_internet_gateway            = true
  create_flow_logs                   = true
  cloud_watch_log_group_name         = "/sandbox/cloudwatch-log-group"
  cloud_watch_log_group_retention    = 7
  cloud_watch_log_group_skip_destroy = false

  dhcp_options = {
    dhcp_options_name   = "example_dhcp_option"
    domain_name         = "example.com"
    domain_name_servers = ["AmazonProvidedDNS"]
  }

  flow_log_role_arn = var.flow_log_role_arn

  nat_gateway_configurations = {
    "Example NAT Gateway A" = {
      subnet = "Example NAT Gateway Subnet A"
    }
  }

  private_subnets = {
    "Example Internal Subnet" = {
      cidr_block        = "172.32.236.16/28"
      availability_zone = "a"
      rt_association    = "Example Internal RT"
    },
    "Example App Subnet A" = {
      cidr_block        = "172.32.2.0/24"
      availability_zone = "a"
      rt_association    = "Example Private RT A"
    },
    "Example App Subnet B" = {
      cidr_block        = "172.32.5.0/24"
      availability_zone = "b"
      rt_association    = "Example Private RT A"
    },
    "Example DB Subnet A" = {
      cidr_block        = "172.32.3.0/24"
      availability_zone = "a"
      rt_association    = "Example Private RT B"
    },
    "Example DB Subnet B" = {
      cidr_block        = "172.32.6.0/24"
      availability_zone = "b"
      rt_association    = "Example Private RT B"
    }
  }

  public_subnets = {
    "Example Web Subnet A" = {
      cidr_block        = "172.32.1.0/24"
      availability_zone = "a"
      rt_association    = "Example Public RT"
    },
    "Example Web Subnet B" = {
      cidr_block        = "172.32.4.0/24"
      availability_zone = "b"
      rt_association    = "Example Public RT"
    },
    "Example NAT Gateway Subnet A" = {
      cidr_block        = "172.32.7.0/28"
      availability_zone = "a"
      rt_association    = "Example NAT GW RT"
    },
    "Example NAT Gateway Subnet B" = {
      cidr_block        = "172.32.8.0/28"
      availability_zone = "b"
      rt_association    = "Example NAT GW RT"
    }
  }

  route_tables = [
    "Example Public RT",
    "Example Internal RT",
    "Example Private RT A",
    "Example NAT GW RT",
    "Example Private RT B"
  ]

  routes = {
    igw = {
      "Example Public RT" = {
        destination = "0.0.0.0/0"
      },
      "Example NAT GW RT" = {
        destination = "0.0.0.0/0"
      }
    },
    nat_gateway = {
      "Example Private RT A" = {
        nat_gateway_name = "Example NAT Gateway A"
        destination      = "0.0.0.0/0"
      },
      "Example Private RT B" = {
        nat_gateway_name = "Example NAT Gateway A"
        destination      = "0.0.0.0/0"
      }
    }
  }

  tags = {
    internet_gateway = {
      Name = "Example IGW"
    },
    vpc = {
      Name = "Example VPC"
    },
    dhcp_options = {
      Name = "example-dhcp-options"
    }
    flow_logs = {
      Name = "Example Flow Flogs"
    }
  }

  vpc = {
    cidr_block           = "172.32.0.0/16"
    enable_dns_hostnames = true
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
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eip.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_dhcp_options.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_dhcp_options) | resource |
| [aws_vpc_dhcp_options_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_dhcp_options_association) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Configuration for the VPC. | <pre>object({<br>    cidr_block           = string<br>    enable_dns_support   = optional(bool, true)<br>    enable_dns_hostnames = optional(bool, false)<br>  })</pre> | n/a | yes |
| <a name="input_cloud_watch_log_group_kms_key_id"></a> [cloud\_watch\_log\_group\_kms\_key\_id](#input\_cloud\_watch\_log\_group\_kms\_key\_id) | The ARN of the KMS key to use for encrypting the cloud watch log group. | `string` | `null` | no |
| <a name="input_cloud_watch_log_group_name"></a> [cloud\_watch\_log\_group\_name](#input\_cloud\_watch\_log\_group\_name) | The name of the CloudWatch Log Group to publish flow logs to. | `string` | `null` | no |
| <a name="input_cloud_watch_log_group_retention"></a> [cloud\_watch\_log\_group\_retention](#input\_cloud\_watch\_log\_group\_retention) | The number of days to retain VPC Flow Logs. | `string` | `"90"` | no |
| <a name="input_cloud_watch_log_group_skip_destroy"></a> [cloud\_watch\_log\_group\_skip\_destroy](#input\_cloud\_watch\_log\_group\_skip\_destroy) | Whether to allow the log group to be destroyed. | `bool` | `true` | no |
| <a name="input_create_flow_logs"></a> [create\_flow\_logs](#input\_create\_flow\_logs) | A boolean flag to enable/disable VPC Flow Logs. | `bool` | `false` | no |
| <a name="input_create_internet_gateway"></a> [create\_internet\_gateway](#input\_create\_internet\_gateway) | A boolean flag to enable/disable an Internet Gateway. | `bool` | `true` | no |
| <a name="input_dhcp_options"></a> [dhcp\_options](#input\_dhcp\_options) | Configuration for DHCP Options Set. | <pre>object({<br>    domain_name          = optional(string, null)<br>    domain_name_servers  = optional(list(string), [])<br>    netbios_name_servers = optional(list(string), [])<br>    netbios_node_type    = optional(string, null)<br>    ntp_servers          = optional(list(string), [])<br>  })</pre> | `null` | no |
| <a name="input_enable_flow_logs"></a> [enable\_flow\_logs](#input\_enable\_flow\_logs) | A boolean flag to enable/disable VPC Flow Logs. | `bool` | `false` | no |
| <a name="input_flow_log_format"></a> [flow\_log\_format](#input\_flow\_log\_format) | The fields to include in the flow log record, in the order in which they should appear. | `string` | `null` | no |
| <a name="input_flow_log_log_group"></a> [flow\_log\_log\_group](#input\_flow\_log\_log\_group) | The name of the CloudWatch Log Group to publish flow logs to. | `string` | `null` | no |
| <a name="input_flow_log_role_arn"></a> [flow\_log\_role\_arn](#input\_flow\_log\_role\_arn) | The ARN of the IAM role that will publish flow logs to CloudWatch Logs. | `string` | `null` | no |
| <a name="input_nat_gateway_configurations"></a> [nat\_gateway\_configurations](#input\_nat\_gateway\_configurations) | The subnets to create the NAT Gateway in. | <pre>map(object({<br>    subnet = string<br>  }))</pre> | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Configuration for subnets. | <pre>map(object({<br>    availability_zone = optional(string, null)<br>    cidr_block        = string<br>    rt_association    = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Configuration for subnets. | <pre>map(object({<br>    availability_zone = optional(string, null)<br>    cidr_block        = string<br>    rt_association    = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | The names of the route tables to create. | `list(string)` | `[]` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | Route configurations | <pre>object({<br>    igw = optional(map(object({<br>      destination = string<br>    })), {})<br>    nat_gateway = optional(map(object({<br>      nat_gateway_name = string<br>      destination      = string<br>    })), {})<br>  })</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags. | <pre>object({<br>    internet_gateway = optional(map(string), {})<br>    vpc              = optional(map(string), {})<br>    dhcp_options     = optional(map(string), {})<br>    flow_logs        = optional(map(string), {})<br>  })</pre> | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_watch_log_group_arn"></a> [cloud\_watch\_log\_group\_arn](#output\_cloud\_watch\_log\_group\_arn) | The ARN of the CloudWatch Log Group created by this module. |
| <a name="output_default_nacl_id"></a> [default\_nacl\_id](#output\_default\_nacl\_id) | The ID of the default NACL created by this module. |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | The ID of the default route table created by this module. |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the default security group created by this module. |
| <a name="output_dhcp_options_arn"></a> [dhcp\_options\_arn](#output\_dhcp\_options\_arn) | The ARN of the DHCP options set created by this module. |
| <a name="output_dhcp_options_id"></a> [dhcp\_options\_id](#output\_dhcp\_options\_id) | The ID of the DHCP options set created by this module. |
| <a name="output_eip_allocation_ids"></a> [eip\_allocation\_ids](#output\_eip\_allocation\_ids) | Allocation IDs of the EIPs created for NAT Gateways |
| <a name="output_flow_log_id"></a> [flow\_log\_id](#output\_flow\_log\_id) | The IDs of the flow logs created by this module. |
| <a name="output_internet_gateway_arn"></a> [internet\_gateway\_arn](#output\_internet\_gateway\_arn) | The ARN of the internet gateway created by this module. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The ID of the internet gateway created by this module. |
| <a name="output_nat_gateway_ids"></a> [nat\_gateway\_ids](#output\_nat\_gateway\_ids) | IDs of the NAT Gateways created |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | The private subnets created by this module. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | The public subnets created by this module. |
| <a name="output_route_tables"></a> [route\_tables](#output\_route\_tables) | The route tables created by this module. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPC created by this module. |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC created by this module. |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC created by this module. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC created by this module. |

<!-- END_TF_DOCS -->