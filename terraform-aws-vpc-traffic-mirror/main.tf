# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/vpc/latest/mirroring/vpc-tm.pdf
#
# ----------------------------------------------------------------------------------------------------

/*
Supported source instance types:
    General Purpose: A1 | M4 | M5 | M5a | M5ad | M5d | M5dn | M5n | M5zn | M6g | M6gd | Mac1 | Mac2 | Mac2-m1ultra | Mac2-m2 | Mac2-m2pro | T3 | T3a | T4g
    Compute Optimized: C4 | C5 | C5a | C5ad | C5d | C5n | C6g | C6gd | C6i
    Memory Optimized: R4 | R5 | R5a | R5ad | R5b | R5d | R5dn | R5n | R6g | R6gd | U-3tb1 | U-6tb1 | U-9tb1 | U-12tb1 | U-18tb1 | U-24tb1 | X1 | X1e | X2gd | X2iezn | z1d
    Storage Optimized: D2 | D3 | D3en | H1 | I3 | I3en
    Accelerated Computing: DL1 | DL2q | F1 | G3 | G4ad | G4dn | G5 | G5g | Inf1 | P2 | P3 | P3dn | P4d | P4de | VT1
*/

# ----------------------------------------------------------------------------------------------------
#
# TRAFFIC MIRROR TARGET
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_target
#
# ----------------------------------------------------------------------------------------------------

resource "aws_ec2_traffic_mirror_target" "nlb" {
  count = var.target_nlb != null ? 1 : 0

  description               = var.mirror_target_description
  network_load_balancer_arn = var.target_nlb

  tags = {
    Name = var.vpc_traffic_mirror_name
  }
}

resource "aws_ec2_traffic_mirror_target" "eni" {
  count = var.target_eni != null ? 1 : 0

  description          = var.mirror_target_description
  network_interface_id = var.target_eni

  tags = {
    Name = var.vpc_traffic_mirror_name
  }
}

resource "aws_ec2_traffic_mirror_target" "gwlb" {
  count = var.target_glb != null ? 1 : 0

  description                       = var.mirror_target_description
  gateway_load_balancer_endpoint_id = var.target_glb

  tags = {
    Name = var.vpc_traffic_mirror_name
  }
}

# ----------------------------------------------------------------------------------------------------
#
# TRAFFIC MIRROR FILTER
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_filter
#
# ----------------------------------------------------------------------------------------------------

resource "aws_ec2_traffic_mirror_filter" "filter" {
  description      = var.mirror_filter_description
  network_services = var.mirror_network_services

  tags = {
    Name = var.vpc_traffic_mirror_name
  }
}

# ----------------------------------------------------------------------------------------------------
#
# TRAFFIC MIRROR FILTER RULE
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_filter_rule
#
# ----------------------------------------------------------------------------------------------------

resource "aws_ec2_traffic_mirror_filter_rule" "rule_out" {
  for_each = var.egress_filter_rules

  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.filter.id
  destination_cidr_block   = each.value.destination_cidr_block
  rule_action              = each.value.rule_action
  rule_number              = each.value.rule_number
  source_cidr_block        = each.value.source_cidr_block
  traffic_direction        = "egress"

  description = each.value.rule_description
  protocol    = each.value.rule_protocol

  dynamic "destination_port_range" {
    for_each = (each.value.dst_from_port != null && each.value.dst_to_port != null) ? [1] : []

    content {
      from_port = each.value.dst_from_port
      to_port   = each.value.dst_to_port
    }
  }

  dynamic "source_port_range" {
    for_each = (each.value.src_from_port != null && each.value.src_to_port != null) ? [1] : []

    content {
      from_port = each.value.src_from_port
      to_port   = each.value.src_to_port
    }
  }
}

resource "aws_ec2_traffic_mirror_filter_rule" "rule_in" {
  for_each = var.ingress_filter_rules

  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.filter.id
  destination_cidr_block   = each.value.destination_cidr_block
  rule_action              = each.value.rule_action
  rule_number              = each.value.rule_number
  source_cidr_block        = each.value.source_cidr_block
  traffic_direction        = "ingress"

  description = each.value.rule_description
  protocol    = each.value.rule_protocol

  dynamic "destination_port_range" {
    for_each = (each.value.dst_from_port != null && each.value.dst_to_port != null) ? [1] : []

    content {
      from_port = each.value.dst_from_port
      to_port   = each.value.dst_to_port
    }
  }

  dynamic "source_port_range" {
    for_each = (each.value.src_from_port != null && each.value.src_to_port != null) ? [1] : []

    content {
      from_port = each.value.src_from_port
      to_port   = each.value.src_to_port
    }
  }
}

# ----------------------------------------------------------------------------------------------------
#
# TRAFFIC MIRROR SESSION
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_traffic_mirror_session
#
# ----------------------------------------------------------------------------------------------------

resource "aws_ec2_traffic_mirror_session" "session" {
  network_interface_id     = var.source_eni
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.filter.id
  traffic_mirror_target_id = try(aws_ec2_traffic_mirror_target.eni[0].id, aws_ec2_traffic_mirror_target.nlb[0].id, aws_ec2_traffic_mirror_target.gwlb[0].id)
  session_number           = var.session_number

  description        = var.session_description
  packet_length      = var.packet_length
  virtual_network_id = var.virtual_network_id

  tags = {
    Name = var.vpc_traffic_mirror_name
  }
}
