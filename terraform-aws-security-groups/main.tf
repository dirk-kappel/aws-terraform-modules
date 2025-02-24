#--------------------------------------------------
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html
#
#--------------------------------------------------

#-------------------------------------------------- 
# SECURITY GROUPS
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
#
#-------------------------------------------------- 

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  description = var.security_group_description
  name_prefix = var.security_group_name_prefix
  name        = var.security_group_name

  tags = {
    Name = var.security_group_name
  }
}

#-------------------------------------------------- 
# SECURITY GROUP RULES
#
# http://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule
#
#-------------------------------------------------- 

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules

  ip_protocol       = each.value.ip_protocol
  security_group_id = aws_security_group.this.id

  cidr_ipv4                    = each.value.cidr_ipv4
  description                  = each.value.rule_description
  from_port                    = each.value.from_port
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  to_port                      = each.value.to_port

  tags = {
    Name = each.key
  }
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules

  ip_protocol       = each.value.ip_protocol
  security_group_id = aws_security_group.this.id

  cidr_ipv4                    = each.value.cidr_ipv4
  description                  = each.value.rule_description
  from_port                    = each.value.from_port
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  to_port                      = each.value.to_port

  tags = {
    Name = each.key
  }
}
