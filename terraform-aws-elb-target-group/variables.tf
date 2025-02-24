variable "attach_target" {
  description = "Whether to attach a target to the target group"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "The ARN of the certificate to use. Required if protocol is HTTPS."
  type        = string
  default     = null
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds."
  type        = number
  default     = 300
}

variable "health_check" {
  description = "Health check configuration"
  type = object({
    enabled             = bool
    healthy_threshold   = number
    interval            = number
    matcher             = string
    path                = string
    port                = string
    protocol            = string
    timeout             = number
    unhealthy_threshold = number
  })
  default = {
    enabled             = true
    healthy_threshold   = null
    interval            = null
    matcher             = null
    path                = null
    port                = null
    protocol            = null
    timeout             = null
    unhealthy_threshold = null
  }
}

variable "lambda_multi_value_headers_enabled" {
  description = "Indicates whether multi-value headers should be used"
  type        = bool
  default     = false
}

variable "load_balancing_algorithm_type" {
  description = "The load balancing algorithm to use. Valid values are round_robin and least_outstanding_requests."
  type        = string
  default     = "round_robin"
}

variable "proxy_protocol_v2" {
  description = "If enabled, the target group will be a proxy protocol v2 target group"
  type        = bool
  default     = false
}

variable "slow_start" {
  description = "The time period, in seconds, during which a newly registered target receives a linearly increasing share of the traffic to the target group. After this time period ends, the target receives its full share of traffic. Default is 0."
  type        = number
  default     = 0
}

variable "tg_stickiness" {
  description = "A stickiness block. Stickiness blocks are documented below."
  type = object({
    cookie_duration = number
    enabled         = bool
    type            = string

  })
  default = null
}

variable "target_group_name" {
  description = "The name of the target group."
  type        = string
}

variable "target_group_port" {
  description = "Port on which targets receive traffic. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda."
  type        = string
  default     = null
}

variable "target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets. Required when target_type is instance, ip, or alb. Does not apply when target_type is lambda."
  type        = string
  default     = null
}

variable "target_id" {
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container. If the target type is ip, specify an IP address. If the target type is lambda, specify the Lambda function ARN. If the target type is alb, specify the ALB ARN."
  type        = string
  default     = null
}
variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address). The default is instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}