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