#--------------------------------------------------
# APPLICATION LOAD BALANCER
#--------------------------------------------------

module "application_load_balancer" {
  source = "../../../terraform-aws-elb"

  access_logs_enabled                 = false
  lb_drop_invalid_header_fields       = true
  lb_enable_cross_zone_load_balancing = false
  lb_enable_deletion_protection       = false
  lb_name                             = "ALB-Test"
  lb_type                             = "application"
  lb_subnets                          = var.subnets
  security_group_ids                  = var.security_group_ids
  vpc_id                              = var.vpc_id

  lb_listeners = [
    # {
    #   listener_port       = 80
    #   target_group_arn    = module.alb_target_group_80.lb_target_group_arn
    #   listener_protocol   = "HTTP"
    #   routing_action_type = "forward"
    # },
    {
      listener_port       = 443
      target_group_arn    = module.alb_target_group_443.lb_target_group_arn
      listener_protocol   = "HTTPS"
      ssl_policy          = "ELBSecurityPolicy-2016-08"
      certificate_arn     = var.alb_certificate_arn
      routing_action_type = "forward"
    }
  ]

  lb_redirects = [
    {
      listener_port        = 80
      listener_protocol    = "HTTP"
      redirect_port        = 443
      redirect_protocol    = "HTTPS"
      redirect_status_code = "HTTP_301"
    }
  ]

  lb_listener_rules = [
    # {
    #   listener_port = 80
    #   priority      = 1
    #   condition = {
    #     field  = "host_header"
    #     values = ["example.com"]
    #   }
    #   action = {
    #     type             = "forward"
    #     target_group_arn = module.alb_target_group_80.lb_target_group_arn
    #   }
    # },
    {
      listener_port = 443
      priority      = 1
      condition = {
        field  = "host_header"
        values = ["example.com"]
      }
      action = {
        type             = "forward"
        target_group_arn = module.alb_target_group_443.lb_target_group_arn
      }
    }
  ]
}

#--------------------------------------------------
# NETWORK LOAD BALANCER
#--------------------------------------------------

module "network_load_balancer" {
  source = "../../../terraform-aws-elb"

  access_logs_enabled                 = false
  lb_enable_cross_zone_load_balancing = false
  lb_enable_deletion_protection       = false
  lb_name                             = "NLB-Test"
  lb_type                             = "network"
  lb_subnets                          = var.subnets
  vpc_id                              = var.vpc_id

  lb_listeners = [
    {
      listener_port       = 80
      target_group_arn    = module.nlb_target_group_443.lb_target_group_arn
      listener_protocol   = "TCP"
      routing_action_type = "forward"
    },
    {
      listener_port       = 443
      target_group_arn    = module.nlb_target_group_443.lb_target_group_arn
      listener_protocol   = "TCP"
      routing_action_type = "forward"
    }
  ]
}

#--------------------------------------------------
# ALB TARGET GROUPS
#--------------------------------------------------

module "alb_target_group_443" {
  source = "../../../terraform-aws-elb-target-group"

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

# module "alb_target_group_80" {
#   source = "../../../terraform-aws-elb-target-group"

#   health_check = {
#     enabled             = true
#     healthy_threshold   = 5
#     interval            = 30
#     matcher             = "200"
#     path                = "/"
#     port                = "traffic-port"
#     protocol            = "HTTP"
#     timeout             = 5
#     unhealthy_threshold = 2
#   }
#   load_balancing_algorithm_type = "round_robin"
#   target_group_name             = "TEST-DEV-ALB-TG-1"
#   target_group_port             = 80
#   target_group_protocol         = "HTTP"
#   target_type                   = "instance"
#   vpc_id                        = var.vpc_id
# }
#--------------------------------------------------
# NLB TARGET GROUPS
#--------------------------------------------------

module "nlb_target_group_443" {
  source = "../../../terraform-aws-elb-target-group"

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
  attach_target         = true
  target_id             = module.application_load_balancer.lb_arn
  target_type           = "alb"
  vpc_id                = var.vpc_id

  depends_on = [module.application_load_balancer]
}

# module "nlb_target_group_80" {
#   source = "../../../terraform-aws-elb-target-group"

#   health_check = {
#     enabled             = true
#     healthy_threshold   = 3
#     interval            = 30
#     matcher             = "200-399"
#     path                = "/"
#     port                = "traffic-port"
#     protocol            = "HTTP"
#     timeout             = 6
#     unhealthy_threshold = 3
#   }
#   target_group_name     = "TEST-DEV-NLB-TG-1"
#   target_group_port     = 80
#   target_group_protocol = "TCP"
#   attach_target         = true
#   target_id             = module.application_load_balancer.lb_arn
#   target_type           = "alb"
#   vpc_id                = var.vpc_id

#   depends_on = [module.application_load_balancer]
# }