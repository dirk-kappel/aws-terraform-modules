#-------------------------------------------------- 
# SECURITY GROUPS
#-------------------------------------------------- 

resource "aws_security_group" "this" {
  name        = "${var.environment}-${var.name}"
  description = var.description
  vpc_id      = var.vpc_id
  
  tags = {
    Name = "${var.environment}-${var.name}"
  }
}

#-------------------------------------------------- 
# SECURITY GROUP RULES
#-------------------------------------------------- 

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.ingress_rules != null ? var.ingress_rules : {}

  cidr_ipv4                    = each.value.cidr_ipv4
  referenced_security_group_id = each.value.referenced_security_group_id
  description                  = each.value.description
  from_port                    = each.value.from_port
  ip_protocol                  = each.value.ip_protocol
  to_port                      = each.value.to_port
  security_group_id            = aws_security_group.this.id
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.egress_rules != null ? var.egress_rules : {}

  cidr_ipv4                    = each.value.cidr_ipv4
  referenced_security_group_id = each.value.referenced_security_group_id
  description                  = each.value.description
  from_port                    = each.value.from_port
  ip_protocol                  = each.value.ip_protocol
  to_port                      = each.value.to_port
  security_group_id            = aws_security_group.this.id
}