<!-- BEGIN_TF_DOCS -->

# AWS VPC Traffic Mirror Terraform module

Terraform module which creates VPC Traffic Mirror resources in AWS

## Usage
```hcl
module "vpc_traffic_mirror" {
  source = "../"

  source_eni     = var.source_eni
  target_eni     = var.target_eni
  session_number = 1

  egress_filter_rules = {
    "rule1" = {
      rule_description       = "Accept all traffic"
      destination_cidr_block = "0.0.0.0/0"
      source_cidr_block      = "0.0.0.0/0"
      rule_number            = 100
      rule_action            = "accept"
    }
  }

  ingress_filter_rules = {
    "rule1" = {
      rule_description       = "Accept all traffic"
      destination_cidr_block = "0.0.0.0/0"
      source_cidr_block      = "0.0.0.0/0"
      rule_number            = 100
      rule_action            = "accept"
    }
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
| [aws_ec2_traffic_mirror_filter.filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_filter) | resource |
| [aws_ec2_traffic_mirror_filter_rule.rule_in](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_filter_rule) | resource |
| [aws_ec2_traffic_mirror_filter_rule.rule_out](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_filter_rule) | resource |
| [aws_ec2_traffic_mirror_session.session](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_session) | resource |
| [aws_ec2_traffic_mirror_target.eni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_target) | resource |
| [aws_ec2_traffic_mirror_target.gwlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_target) | resource |
| [aws_ec2_traffic_mirror_target.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_target) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_session_number"></a> [session\_number](#input\_session\_number) | The session number determines the order in which sessions are evaluated when an interface is used by multiple sessions. The first session with a matching filter is the one that mirrors the packets. | `number` | n/a | yes |
| <a name="input_source_eni"></a> [source\_eni](#input\_source\_eni) | ID of the source network interface. Not all network interfaces are eligible as mirror sources. On EC2 instances only nitro based instances support mirroring. | `string` | n/a | yes |
| <a name="input_egress_filter_rules"></a> [egress\_filter\_rules](#input\_egress\_filter\_rules) | Optional map of egress traffic mirror filter rules | <pre>map(object({<br>    rule_description       = optional(string, "Egress filter rule")<br>    destination_cidr_block = string<br>    source_cidr_block      = string<br>    rule_number            = number<br>    rule_action            = string<br>    rule_protocol          = optional(number, null)<br>    dst_from_port          = optional(number, null)<br>    dst_to_port            = optional(number, null)<br>    src_from_port          = optional(number, null)<br>    src_to_port            = optional(number, null)<br>  }))</pre> | `{}` | no |
| <a name="input_ingress_filter_rules"></a> [ingress\_filter\_rules](#input\_ingress\_filter\_rules) | Optional map of ingress traffic mirror filter rules | <pre>map(object({<br>    rule_description       = optional(string, "Ingress filter rule")<br>    destination_cidr_block = string<br>    source_cidr_block      = string<br>    rule_number            = number<br>    rule_action            = string<br>    rule_protocol          = optional(number, null)<br>    dst_from_port          = optional(number, null)<br>    dst_to_port            = optional(number, null)<br>    src_from_port          = optional(number, null)<br>    src_to_port            = optional(number, null)<br>  }))</pre> | `{}` | no |
| <a name="input_mirror_filter_description"></a> [mirror\_filter\_description](#input\_mirror\_filter\_description) | A description of the filter. | `string` | `null` | no |
| <a name="input_mirror_network_services"></a> [mirror\_network\_services](#input\_mirror\_network\_services) | List of amazon network services that should be mirrored. Valid values: amazon-dns. | `list(string)` | `null` | no |
| <a name="input_mirror_target_description"></a> [mirror\_target\_description](#input\_mirror\_target\_description) | A description of the traffic mirror target. | `string` | `null` | no |
| <a name="input_packet_length"></a> [packet\_length](#input\_packet\_length) | The number of bytes in each packet to mirror. These are bytes after the VXLAN header. Do not specify this parameter when you want to mirror the entire packet. To mirror a subset of the packet, set this to the length (in bytes) that you want to mirror. | `number` | `null` | no |
| <a name="input_session_description"></a> [session\_description](#input\_session\_description) | A description of the traffic mirror session. | `string` | `null` | no |
| <a name="input_target_eni"></a> [target\_eni](#input\_target\_eni) | The network interface ID that is associated with the target. | `string` | `null` | no |
| <a name="input_target_glb"></a> [target\_glb](#input\_target\_glb) | The VPC Endpoint Id of the Gateway Load Balancer that is associated with the target. | `string` | `null` | no |
| <a name="input_target_nlb"></a> [target\_nlb](#input\_target\_nlb) | The Amazon Resource Name (ARN) of the Network Load Balancer that is associated with the target. | `string` | `null` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The VXLAN ID for the Traffic Mirror session. For more information about the VXLAN protocol, see RFC 7348. If you do not specify a VirtualNetworkId, an account-wide unique id is chosen at random. | `number` | `null` | no |
| <a name="input_vpc_traffic_mirror_name"></a> [vpc\_traffic\_mirror\_name](#input\_vpc\_traffic\_mirror\_name) | The name tag to apply to the session and mirror resources. | `string` | `"VPC Traffic Mirror"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mirror_filter_arn"></a> [mirror\_filter\_arn](#output\_mirror\_filter\_arn) | The ARN of the traffic mirror filter. |
| <a name="output_mirror_session_arn"></a> [mirror\_session\_arn](#output\_mirror\_session\_arn) | The ARN of the traffic mirror session. |
| <a name="output_traffic_mirror_target_id"></a> [traffic\_mirror\_target\_id](#output\_traffic\_mirror\_target\_id) | The ID of the Traffic Mirror target. |

<!-- END_TF_DOCS -->