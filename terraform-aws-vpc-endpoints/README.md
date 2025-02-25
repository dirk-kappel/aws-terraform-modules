<!-- BEGIN_TF_DOCS -->

# AWS VPC Endpoint Terraform module

Terraform module which creates VPC Endpoint resources on AWS

## Usage
```hcl
module "vpc_endpoints" {
  source = "../"

  vpc_id = var.vpc_id

  gateway_vpc_endpoints = {
    s3 = {
      name            = "Test S3 VPC Endpoint"
      route_table_ids = var.route_table_ids
    }
  }

  interface_vpc_endpoints = {
    "ec2messages" = {
      name                = "Test EC2 Messages VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = true
    }
    "ssm" = {
      name                = "Test SSM VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = false
    }
    "ssmmessages" = {
      name                = "Test SSM Messages VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = false
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
| [aws_vpc_endpoint.gateway_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.interface_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which the endpoint will be used. | `string` | n/a | yes |
| <a name="input_gateway_vpc_endpoints"></a> [gateway\_vpc\_endpoints](#input\_gateway\_vpc\_endpoints) | A map of Gateway VPC Endpoints to provision into the VPC. This is a map of objects with the following attributes:<br>- `policy` = A policy (as JSON string) to attach to the endpoint that controls access to the service. May be `null` for full access.<br>- `route_table_ids`: List of route tables to associate the gateway with. Routes to the gateway<br>  will be automatically added to these route tables. | <pre>map(object({<br>    name            = optional(string)<br>    policy          = optional(string)<br>    route_table_ids = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_interface_vpc_endpoints"></a> [interface\_vpc\_endpoints](#input\_interface\_vpc\_endpoints) | A map of Interface VPC Endpoints to provision into the VPC.<br>This is a map of objects with the following attributes:<br>- `policy`: A policy (as JSON string) to attach to the endpoint that controls access to the service. May be `null` for full access.<br>- `private_dns_enabled`: Set `true` to associate a private hosted zone with the specified VPC<br>- `security_group_ids`: The ID of one or more security groups to associate with the network interface. The first<br>  security group will replace the default association with the VPC's default security group. If you want<br>  to maintain the association with the default security group, either leave `security_group_ids` empty or<br>  include the default security group ID in the list.<br>- `subnet_ids`: List of subnet in which to install the endpoints. | <pre>map(object({<br>    name                = optional(string)<br>    policy              = optional(string)<br>    private_dns_enabled = optional(bool)<br>    vpce_sg_ids         = list(string)<br>    subnet_ids          = list(string)<br>  }))</pre> | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_endpoints"></a> [gateway\_endpoints](#output\_gateway\_endpoints) | A map of the gateway VPC endpoints created by this module. |
| <a name="output_interface_endpoints"></a> [interface\_endpoints](#output\_interface\_endpoints) | A map of the interface VPC endpoints created by this module. |

<!-- END_TF_DOCS -->