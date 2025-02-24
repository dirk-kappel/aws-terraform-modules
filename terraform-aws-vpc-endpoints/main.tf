data "aws_region" "current" {}

resource "aws_vpc_endpoint" "gateway_endpoint" {
  for_each = var.gateway_vpc_endpoints

  service_name      = "com.amazonaws.${data.aws_region.current.name}.${each.key}"
  policy            = var.gateway_vpc_endpoints[each.key].policy
  route_table_ids   = var.gateway_vpc_endpoints[each.key].route_table_ids
  vpc_endpoint_type = "Gateway"
  vpc_id            = var.vpc_id

  tags = {
    Name = "${var.environment}-${each.key}"
  }
}

resource "aws_vpc_endpoint" "interface_endpoint" {
  for_each = var.interface_vpc_endpoints

  service_name        = "com.amazonaws.${data.aws_region.current.name}.${each.key}"
  policy              = var.interface_vpc_endpoints[each.key].policy
  security_group_ids  = var.interface_vpc_endpoints[each.key].vpce_sg_ids
  subnet_ids          = var.interface_vpc_endpoints[each.key].subnet_ids
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
  private_dns_enabled = var.interface_vpc_endpoints[each.key].private_dns_enabled

  tags = {
    Name = "${var.environment}-${each.key}"
  }
}