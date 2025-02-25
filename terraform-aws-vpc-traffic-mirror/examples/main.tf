module "vpc_traffic_mirror" {
  source = "../"

  source_eni     = var.source_eni
  target_eni     = var.target_eni
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
