data "aws_region" "current" {}
#--------------------------------------------------
# VPC
#--------------------------------------------------
resource "aws_vpc" "this" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = var.vpc.enable_dns_support
  enable_dns_hostnames = var.vpc.enable_dns_hostnames

  tags = {
    Name = "${var.environment}-vpc"
  }
}
#--------------------------------------------------
# SUBNETS
#--------------------------------------------------
resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = "${data.aws_region.current.name}${each.value.availability_zone}"
  cidr_block        = each.value.cidr_block

  tags = {
    Name = "${var.environment}-private-${each.value.availability_zone}-${each.key}"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = "${data.aws_region.current.name}${each.value.availability_zone}"
  cidr_block        = each.value.cidr_block

  tags = {
    Name = "${var.environment}-public-${each.value.availability_zone}-${each.key}"
  }
}

resource "aws_internet_gateway" "this" {
  count = var.create_internet_gateway == true ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_vpc_dhcp_options" "this" {
  count = var.dhcp_options != null ? 1 : 0

  domain_name          = var.dhcp_options.domain_name == "region.compute.internal" ? "${data.aws_region.current.name}.compute.internal" : var.dhcp_options.domain_name
  domain_name_servers  = var.dhcp_options.domain_name_servers
  netbios_name_servers = var.dhcp_options.netbios_name_servers
  netbios_node_type    = var.dhcp_options.netbios_node_type
  ntp_servers          = var.dhcp_options.ntp_servers

  tags = {
    Name = "${var.environment}-dhcp"
  }
}

resource "aws_vpc_dhcp_options_association" "this" {
  count = var.dhcp_options != null ? 1 : 0

  vpc_id          = aws_vpc.this.id
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
}
#--------------------------------------------------
# ROUTE TABLES
#--------------------------------------------------
resource "aws_route_table" "this" {
  for_each = toset(var.route_tables)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-${each.value}"
  }
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnets

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.this[each.value.rt_association].id
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnets

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.this[each.value.rt_association].id
}

resource "aws_route" "igw" {
  for_each = var.routes.igw

  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = each.value.destination
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route" "nat_gateway" {
  for_each = var.routes.nat_gateway

  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = each.value.destination
  nat_gateway_id         = aws_nat_gateway.this[each.value.nat_gateway_name].id
}
#--------------------------------------------------
# NAT GATEWAY
#--------------------------------------------------
resource "aws_eip" "nat_gateway" {
  for_each = var.nat_gateway_configurations

  domain = "vpc"

  tags = {
    Name = "${var.environment}-nat-${each.key}"
  }
}

resource "aws_nat_gateway" "this" {
  for_each = var.nat_gateway_configurations

  allocation_id = aws_eip.nat_gateway[each.key].allocation_id
  subnet_id     = aws_subnet.public[each.value.subnet].id

  tags = {
    Name = "${var.environment}-nat-${each.key}"
  }

  depends_on = [
    aws_internet_gateway.this[0]
  ]
}
#--------------------------------------------------
# FLOW LOGS
#--------------------------------------------------
resource "aws_flow_log" "this" {
  count = var.create_flow_logs == true ? 1 : 0

  iam_role_arn    = var.flow_log_role_arn
  log_destination = aws_cloudwatch_log_group.this[0].arn
  log_format      = var.flow_log_format
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this.id

  tags = {
    Name = "${var.environment}-vpc-flow-logs"
  }
}

resource "aws_cloudwatch_log_group" "this" {
  count = var.create_flow_logs == true ? 1 : 0

  name              = "/${var.environment}/vpc-flow-logs"
  skip_destroy      = var.cloud_watch_log_group_skip_destroy
  retention_in_days = var.cloud_watch_log_group_retention
  kms_key_id        = var.cloud_watch_log_group_kms_key_id
}
