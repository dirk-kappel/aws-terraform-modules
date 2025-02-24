<!-- BEGIN_TF_DOCS -->

# AWS Elastic Load Balancer

Terraform module which creates Elastic Load Balancer (Network or Application), LB Listener, and LB Listener rule resources in AWS.

## Usage
```hcl
#--------------------------------------------------
# APPLICATION LOAD BALANCER
#--------------------------------------------------

module "application_load_balancer" {
  source = "../"

  access_logs_enabled                 = false
  lb_enable_cross_zone_load_balancing = false
  lb_enable_deletion_protection       = false
  lb_name                             = "ALB-Test"
  lb_type                             = "application"
  lb_subnets                          = var.subnets
  security_group_ids                  = var.security_group_ids
  vpc_id                              = var.vpc_id

  lb_listeners = [
    {
      listener_port       = 80
      target_group_arn    = var.alb_target_group_arn_80
      listener_protocol   = "HTTP"
      routing_action_type = "forward"
    },
    {
      listener_port       = 443
      target_group_arn    = var.alb_target_group_arn_443
      listener_protocol   = "HTTPS"
      ssl_policy          = "ELBSecurityPolicy-2016-08"
      certificate_arn     = var.alb_certificate_arn
      routing_action_type = "forward"
  }]

  lb_listener_rules = [
    {
      listener_port = 80
      priority      = 1
      condition = {
        field  = "host_header"
        values = ["example.com"]
      }
      action = {
        type             = "forward"
        target_group_arn = var.alb_target_group_arn_80
      }
    },
    {
      listener_port = 443
      priority      = 1
      condition = {
        field  = "host_header"
        values = ["example.com"]
      }
      action = {
        type             = "forward"
        target_group_arn = var.alb_target_group_arn_443
      }
  }]
}

#--------------------------------------------------
# NETWORK LOAD BALANCER
#--------------------------------------------------

module "network_load_balancer" {
  source = "../"

  access_logs_enabled                 = false
  lb_enable_cross_zone_load_balancing = false
  lb_enable_deletion_protection       = false
  lb_name                             = "NLB-Test"
  lb_type                             = "network"
  lb_subnets                          = var.subnets
  vpc_id                              = var.vpc_id

  lb_listeners = [{
    listener_port       = 80
    target_group_arn    = var.nlb_target_group_arn_80
    listener_protocol   = "TCP"
    routing_action_type = "forward"
    },
    {
      listener_port       = 443
      target_group_arn    = var.nlb_target_group_arn_443
      listener_protocol   = "TCP"
      routing_action_type = "forward"
  }]
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.network](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_listeners"></a> [lb\_listeners](#input\_lb\_listeners) | n/a | <pre>list(object({<br>    listener_port       = number<br>    target_group_arn    = string<br>    listener_protocol   = string<br>    ssl_policy          = optional(string, null)<br>    certificate_arn     = optional(string, null)<br>    routing_action_type = string<br>  }))</pre> | n/a | yes |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | The name of the load balancer. | `string` | n/a | yes |
| <a name="input_lb_subnets"></a> [lb\_subnets](#input\_lb\_subnets) | A list of subnet IDs to attach to the LB. | `list(string)` | n/a | yes |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | The type of load balancer. | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | The S3 bucket name to store the logs in. | `string` | `""` | no |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | If true, access logs will be enabled. | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | The prefix to use for the bucket. | `string` | `""` | no |
| <a name="input_lb_drop_invalid_header_fields"></a> [lb\_drop\_invalid\_header\_fields](#input\_lb\_drop\_invalid\_header\_fields) | If true, invalid header fields will be dropped. | `bool` | `false` | no |
| <a name="input_lb_enable_cross_zone_load_balancing"></a> [lb\_enable\_cross\_zone\_load\_balancing](#input\_lb\_enable\_cross\_zone\_load\_balancing) | If true, cross-zone load balancing of the load balancer will be enabled. | `bool` | `false` | no |
| <a name="input_lb_enable_deletion_protection"></a> [lb\_enable\_deletion\_protection](#input\_lb\_enable\_deletion\_protection) | If true, deletion protection will be enabled for the LB. | `bool` | `false` | no |
| <a name="input_lb_enable_http2"></a> [lb\_enable\_http2](#input\_lb\_enable\_http2) | If true, the LB will support HTTP/2. | `bool` | `false` | no |
| <a name="input_lb_internal"></a> [lb\_internal](#input\_lb\_internal) | If true, the LB will be internal. | `string` | `false` | no |
| <a name="input_lb_listener_rules"></a> [lb\_listener\_rules](#input\_lb\_listener\_rules) | n/a | <pre>list(object({<br>    listener_port = number<br>    priority      = number<br>    action = object({<br>      type             = string<br>      target_group_arn = string<br>    })<br>    condition = object({<br>      field  = string<br>      values = list(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_lb_xff_header_processing_mode"></a> [lb\_xff\_header\_processing\_mode](#input\_lb\_xff\_header\_processing\_mode) | Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application. | `string` | `"append"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group IDs to attach to the LB. | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | The ARN of the load balancer created by this module. |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | The DNS name of the load balancer created by this module. |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | The zone ID of the load balancer created by this module. |
### Footer
<!-- END_TF_DOCS -->