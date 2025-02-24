module "vpc_endpoints" {
  source = "../"

  vpc_id = var.vpc_id

  gateway_vpc_endpoints = {
    s3 = {
      name            = "Test S3 VPC Endpoint"
      route_table_ids = var.route_table_ids
    }
  }

  interface_vpc_endpoints = {
    "ec2messages" = {
      name                = "Test EC2 Messages VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = true
    }
    "ssm" = {
      name                = "Test SSM VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = false
    }
    "ssmmessages" = {
      name                = "Test SSM Messages VPC Endpoint"
      vpce_sg_ids         = var.security_group_vpce_ids
      subnet_ids          = var.subnet_ids
      policy              = null
      private_dns_enabled = false
    }
  }
}
