module "vpc" {
  source = "../"

  create_internet_gateway = true
  # create_flow_logs                   = true
  cloud_watch_log_group_retention    = 7
  cloud_watch_log_group_skip_destroy = false

  dhcp_options = {
    dhcp_options_name   = "example_dhcp_option"
    domain_name         = "example.com"
    domain_name_servers = ["AmazonProvidedDNS"]
  }

  flow_log_role_arn = var.flow_log_role_arn

  nat_gateway_configurations = {
    "Example NAT Gateway A" = {
      subnet = "Example NAT Gateway Subnet A"
    }
  }

  private_subnets = {
    "Example Internal Subnet" = {
      cidr_block        = "172.32.236.16/28"
      availability_zone = "a"
      rt_association    = "Example Internal RT"
    },
    "Example App Subnet A" = {
      cidr_block        = "172.32.2.0/24"
      availability_zone = "a"
      rt_association    = "Example Private RT A"
    },
    "Example App Subnet B" = {
      cidr_block        = "172.32.5.0/24"
      availability_zone = "b"
      rt_association    = "Example Private RT A"
    },
    "Example DB Subnet A" = {
      cidr_block        = "172.32.3.0/24"
      availability_zone = "a"
      rt_association    = "Example Private RT B"
    },
    "Example DB Subnet B" = {
      cidr_block        = "172.32.6.0/24"
      availability_zone = "b"
      rt_association    = "Example Private RT B"
    }
  }

  public_subnets = {
    "Example Web Subnet A" = {
      cidr_block        = "172.32.1.0/24"
      availability_zone = "a"
      rt_association    = "Example Public RT"
    },
    "Example Web Subnet B" = {
      cidr_block        = "172.32.4.0/24"
      availability_zone = "b"
      rt_association    = "Example Public RT"
    },
    "Example NAT Gateway Subnet A" = {
      cidr_block        = "172.32.7.0/28"
      availability_zone = "a"
      rt_association    = "Example NAT GW RT"
    },
    "Example NAT Gateway Subnet B" = {
      cidr_block        = "172.32.8.0/28"
      availability_zone = "b"
      rt_association    = "Example NAT GW RT"
    }
  }

  route_tables = [
    "Example Public RT",
    "Example Internal RT",
    "Example Private RT A",
    "Example NAT GW RT",
    "Example Private RT B"
  ]

  routes = {
    igw = {
      "Example Public RT" = {
        destination = "0.0.0.0/0"
      },
      "Example NAT GW RT" = {
        destination = "0.0.0.0/0"
      }
    },
    nat_gateway = {
      "Example Private RT A" = {
        nat_gateway_name = "Example NAT Gateway A"
        destination      = "0.0.0.0/0"
      },
      "Example Private RT B" = {
        nat_gateway_name = "Example NAT Gateway A"
        destination      = "0.0.0.0/0"
      }
    }
  }

  vpc = {
    cidr_block           = "172.32.0.0/16"
    enable_dns_hostnames = true
  }
}