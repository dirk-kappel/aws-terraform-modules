resource "aws_lb_target_group" "this" {
  deregistration_delay               = var.deregistration_delay
  name                               = var.target_group_name
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = var.target_group_protocol != "TCP" ? var.load_balancing_algorithm_type : null
  port                               = var.target_group_port
  protocol                           = var.target_group_protocol
  proxy_protocol_v2                  = var.proxy_protocol_v2
  slow_start                         = var.slow_start
  target_type                        = var.target_type
  vpc_id                             = var.vpc_id

  health_check {
    enabled             = var.health_check.enabled
    healthy_threshold   = var.health_check.healthy_threshold
    interval            = var.health_check.interval
    matcher             = var.health_check.matcher
    path                = var.health_check.path
    port                = var.health_check.port
    protocol            = var.health_check.protocol
    timeout             = var.health_check.timeout
    unhealthy_threshold = var.health_check.unhealthy_threshold
  }

  dynamic "stickiness" {
    for_each = var.tg_stickiness == null ? [] : [var.tg_stickiness]

    content {
      cookie_duration = var.tg_stickiness.cookie_duration
      enabled         = var.tg_stickiness.enabled
      type            = var.tg_stickiness.type
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count = var.attach_target == true ? 1 : 0

  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.target_id
  port             = var.target_group_port
}
