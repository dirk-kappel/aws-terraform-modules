# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/whitepapers/latest/aws-privatelink/aws-privatelink.pdf#what-are-vpc-endpoints
#
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
#
# VPC ENDPOINT
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint
#
# ----------------------------------------------------------------------------------------------------

data "aws_region" "current" {}

resource "aws_vpc_endpoint" "gateway_endpoint" {
  for_each = var.gateway_vpc_endpoints

  vpc_id = var.vpc_id

  policy            = each.value.policy
  route_table_ids   = each.value.route_table_ids
  service_name      = "com.amazonaws.${data.aws_region.current.name}.${each.key}"
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = each.value.name
  }
}

resource "aws_vpc_endpoint" "interface_endpoint" {
  for_each = var.interface_vpc_endpoints

  vpc_id = var.vpc_id

  policy              = each.value.policy
  private_dns_enabled = each.value.private_dns_enabled
  service_name        = "com.amazonaws.${data.aws_region.current.name}.${each.key}"
  subnet_ids          = each.value.subnet_ids
  security_group_ids  = each.value.vpce_sg_ids
  vpc_endpoint_type   = "Interface"

  tags = {
    Name = each.value.name
  }
}