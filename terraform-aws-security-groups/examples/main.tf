module "security_group" {
  source = "../"

  security_group_name        = "Test Security Group"
  security_group_description = "This is a test security group."
  ingress_rules = {
    rule_1 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow HTTP Traffic"
      from_port        = 80
      ip_protocol      = "tcp"
      to_port          = 80
    },
    rule_2 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow SSH Traffic"
      from_port        = 22
      ip_protocol      = "tcp"
      to_port          = 22
    },
    rule_3 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow ICMP Traffic"
      from_port        = -1
      ip_protocol      = "icmp"
      to_port          = -1
    },
    rule_4 = {
      cidr_ipv4        = "172.32.0.0/16"
      rule_description = "Allow HTTPS Traffic"
      from_port        = 443
      ip_protocol      = "tcp"
      to_port          = 443
    }
  }
  egress_rules = {
    rule_1 = {
      cidr_ipv4        = "0.0.0.0/0"
      rule_description = "Allow All Traffic"
      from_port        = -1
      ip_protocol      = "-1"
      to_port          = -1
    }
  }
  vpc_id = var.vpc_id
}
