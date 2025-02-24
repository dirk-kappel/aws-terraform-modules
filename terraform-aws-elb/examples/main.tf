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
