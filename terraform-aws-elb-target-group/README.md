<!-- BEGIN_TF_DOCS -->

# AWS Elastic Load Balancer Target Group

Terraform module which creates ELB Target Group resources.

## Usage
```hcl
#--------------------------------------------------
# ALB TARGET GROUPS
#--------------------------------------------------

module "alb_target_group_443" {
  source = "../"

  health_check = {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTPS"
    timeout             = 5
    unhealthy_threshold = 2
  }
  load_balancing_algorithm_type = "round_robin"
  target_group_name             = "TEST-ALB-TG-1-SECURE"
  target_group_port             = 443
  target_group_protocol         = "HTTPS"
  target_type                   = "instance"
  vpc_id                        = var.vpc_id
}

module "alb_target_group_80" {
  source = "../"

  health_check = {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  load_balancing_algorithm_type = "round_robin"
  target_group_name             = "TEST-DEV-ALB-TG-1"
  target_group_port             = 80
  target_group_protocol         = "HTTP"
  target_type                   = "instance"
  vpc_id                        = var.vpc_id
}
#--------------------------------------------------
# NLB TARGET GROUPS
#--------------------------------------------------

module "nlb_target_group_443" {
  source = "../"

  health_check = {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200-399"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTPS"
    timeout             = 10
    unhealthy_threshold = 3
  }
  target_group_name     = "TEST-NLB-TG-1-SECURE"
  target_group_port     = 443
  target_group_protocol = "TCP"
  attach_target         = false
  target_id             = var.alb_arn
  target_type           = "alb"
  vpc_id                = var.vpc_id
}

module "nlb_target_group_80" {
  source = "../"

  health_check = {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200-399"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
  target_group_name     = "TEST-DEV-NLB-TG-1"
  target_group_port     = 80
  target_group_protocol = "TCP"
  attach_target         = false
  target_id             = var.alb_arn
  target_type           = "alb"
  vpc_id                = var.vpc_id
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | The name of the target group. | `string` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address). The default is instance. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |
| <a name="input_attach_target"></a> [attach\_target](#input\_attach\_target) | Whether to attach a target to the target group | `bool` | `false` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the certificate to use. Required if protocol is HTTPS. | `string` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check configuration | <pre>object({<br>    enabled             = bool<br>    healthy_threshold   = number<br>    interval            = number<br>    matcher             = string<br>    path                = string<br>    port                = string<br>    protocol            = string<br>    timeout             = number<br>    unhealthy_threshold = number<br>  })</pre> | <pre>{<br>  "enabled": true,<br>  "healthy_threshold": null,<br>  "interval": null,<br>  "matcher": null,<br>  "path": null,<br>  "port": null,<br>  "protocol": null,<br>  "timeout": null,<br>  "unhealthy_threshold": null<br>}</pre> | no |
| <a name="input_load_balancing_algorithm_type"></a> [load\_balancing\_algorithm\_type](#input\_load\_balancing\_algorithm\_type) | The load balancing algorithm to use. Valid values are round\_robin and least\_outstanding\_requests. | `string` | `"round_robin"` | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Port on which targets receive traffic. Required when target\_type is instance, ip or alb. Does not apply when target\_type is lambda. | `string` | `null` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Protocol to use for routing traffic to the targets. Required when target\_type is instance, ip, or alb. Does not apply when target\_type is lambda. | `string` | `null` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the Lambda function ARN. If the target type is alb, specify the ALB ARN. | `string` | `null` | no |
| <a name="input_tg_stickiness"></a> [tg\_stickiness](#input\_tg\_stickiness) | A stickiness block. Stickiness blocks are documented below. | <pre>object({<br>    cookie_duration = number<br>    enabled         = bool<br>    type            = string<br><br>  })</pre> | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_target_group_arn"></a> [lb\_target\_group\_arn](#output\_lb\_target\_group\_arn) | The ARN of the load balancer target group created by this module. |
### Footer
<!-- END_TF_DOCS -->