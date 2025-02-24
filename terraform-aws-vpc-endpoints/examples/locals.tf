# This is used in the terraform code when variables are used for subnet_ids, route_table_ids, and security_group_vpce_ids.

locals {
  gateway_vpc_endpoints = {
    "s3" = {
      name = "DEV_VPC Endpoint_S3"
      route_table_ids = flatten([
        values(module.vpc.public_route_tables)[*].id,
        values(module.vpc.private_route_tables)[*].id
      ])
    }
  }
  interface_vpc_endpoints = {
    "ec2messages" = {
      name                = "DEV_VPC Endpoint_EC2 Messages"
      vpce_sg_ids         = [module.security_groups_vpce.security_group_id]
      subnet_ids          = [module.vpc.subnets["dev_web_tier_a"].id, module.vpc.subnets["dev_web_tier_b"].id]
      policy              = null
      private_dns_enabled = true
    }
    "ssm" = {
      name                = "DEV_VPC Endpoint_SSM"
      vpce_sg_ids         = [module.security_groups_vpce.security_group_id]
      subnet_ids          = [module.vpc.subnets["dev_web_tier_a"].id, module.vpc.subnets["dev_web_tier_b"].id]
      policy              = null
      private_dns_enabled = false
    }
    "ssmmessages" = {
      name                = "DEV_VPC Endpoint_SSM Messages"
      vpce_sg_ids         = [module.security_groups_vpce.security_group_id]
      subnet_ids          = [module.vpc.subnets["dev_web_tier_a"].id, module.vpc.subnets["dev_web_tier_b"].id]
      policy              = null
      private_dns_enabled = false
    }
  }
}