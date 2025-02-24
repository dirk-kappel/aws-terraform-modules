module "vpc_traffic_mirror" {
  source = "../"

  source_eni     = "eni-003fcbfeec2e42e9f"
  target_eni     = "eni-0f10e30ce1dc2ca5f"
  session_number = 1
  egress_filter_rules = {
    "rule1" = {
      rule_description       = "Accept all traffic"
      destination_cidr_block = "0.0.0.0/0"
      source_cidr_block      = "0.0.0.0/0"
      rule_number            = 100
      rule_action            = "accept"
    }
  }
  ingress_filter_rules = {
    "rule1" = {
      rule_description       = "Accept all traffic"
      destination_cidr_block = "0.0.0.0/0"
      source_cidr_block      = "0.0.0.0/0"
      rule_number            = 100
      rule_action            = "accept"
    }
  }
}
