#--------------------------------------------------
# ELASTIC LOAD BALANCER
#--------------------------------------------------

resource "aws_lb" "application" {
  count = var.lb_type == "application" ? 1 : 0

  name                             = var.lb_name
  internal                         = var.lb_internal
  load_balancer_type               = "application"
  security_groups                  = var.security_group_ids
  subnets                          = var.lb_subnets
  enable_cross_zone_load_balancing = var.lb_enable_cross_zone_load_balancing
  xff_header_processing_mode       = var.lb_xff_header_processing_mode
  enable_http2                     = var.lb_enable_http2
  enable_deletion_protection       = var.lb_enable_deletion_protection
  drop_invalid_header_fields       = var.lb_drop_invalid_header_fields

  access_logs {
    bucket  = var.access_logs_bucket
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }
}

resource "aws_lb" "network" {
  count = var.lb_type == "network" ? 1 : 0

  name                             = var.lb_name
  internal                         = var.lb_internal
  load_balancer_type               = "network"
  security_groups                  = var.security_group_ids
  subnets                          = var.lb_subnets
  dns_record_client_routing_policy = var.lb_dns_record_client_routing_policy
  enable_cross_zone_load_balancing = var.lb_enable_cross_zone_load_balancing
  enable_deletion_protection       = var.lb_enable_deletion_protection

  access_logs {
    bucket  = var.access_logs_bucket
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }
}

resource "aws_lb_listener" "this" {
  for_each = { for listener in var.lb_listeners : listener.listener_port => listener }

  load_balancer_arn = try(aws_lb.network[0].arn, aws_lb.application[0].arn)
  port              = each.value.listener_port
  protocol          = each.value.listener_protocol
  ssl_policy        = try(each.value.lb_ssl_policy, null)
  certificate_arn   = try(each.value.certificate_arn, null)

  default_action {
    type             = each.value.routing_action_type
    target_group_arn = each.value.target_group_arn
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "redirects" {
  for_each = { for redirect in var.lb_redirects : redirect.listener_port => redirect }

  load_balancer_arn = aws_lb.application[0].arn
  port              = each.value.listener_port
  protocol          = each.value.listener_protocol

  default_action {
    type             = "redirect"
    redirect {
      port        = each.value.redirect_port
      protocol    = each.value.redirect_protocol
      status_code = each.value.redirect_status_code
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "this" {
  for_each = { for listener in var.lb_listener_rules : "${listener.listener_port}-${listener.priority}" => listener }

  listener_arn = aws_lb_listener.this[each.value.listener_port].arn
  priority     = each.value.priority

  action {
    type             = each.value.action.type
    target_group_arn = each.value.action.target_group_arn
  }

  condition {
    dynamic "host_header" {
      for_each = each.value.condition.field == "host_header" ? toset(each.value.condition.values) : []
      content {
        values = [host_header.value]
      }
    }
    dynamic "path_pattern" {
      for_each = each.value.condition.field == "path_pattern" ? toset(each.value.condition.values) : []
      content {
        values = [path_pattern.value]
      }
    }
  }
}
