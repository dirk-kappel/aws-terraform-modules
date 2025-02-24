variable "cloud_watch_log_group_kms_key_id" {
  description = "The ARN of the KMS key to use for encrypting the cloud watch log group."
  type        = string
  default     = null
}

variable "cloud_watch_log_group_retention" {
  description = "The number of days to retain VPC Flow Logs."
  type        = string
  default     = "90"
}

variable "cloud_watch_log_group_skip_destroy" {
  description = "Whether to allow the log group to be destroyed."
  type        = bool
  default     = true
}

variable "create_flow_logs" {
  description = "A boolean flag to enable/disable VPC Flow Logs."
  type        = bool
  default     = true
}

variable "create_internet_gateway" {
  description = "A boolean flag to enable/disable an Internet Gateway."
  type        = bool
  default     = true
}

variable "dhcp_options" {
  description = "Configuration for DHCP Options Set."
  type = object({
    domain_name          = optional(string, null)
    domain_name_servers  = optional(list(string), [])
    netbios_name_servers = optional(list(string), [])
    netbios_node_type    = optional(string, null)
    ntp_servers          = optional(list(string), [])
  })
  default = null
}

variable "environment" {
  description = "Specifies the deployment environment for the resources. Accepted values are 'dev', 'stage', or 'prod'."
  type        = string
  default     = null
}

variable "flow_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "flow_log_role_arn" {
  description = "The ARN of the IAM role that will publish flow logs to CloudWatch Logs."
  type        = string
  default     = null
}

variable "nat_gateway_configurations" {
  description = "The subnets to create the NAT Gateway in."
  type = map(object({
    subnet = string
  }))
  default = {}
}

variable "private_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone = optional(string, null)
    cidr_block        = string
    rt_association    = optional(string, null)
  }))
  default = {}
}

variable "public_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone = optional(string, null)
    cidr_block        = string
    rt_association    = optional(string, null)
  }))
  default = {}
}

variable "routes" {
  description = "Route configurations"
  type = object({
    igw = optional(map(object({
      destination = string
    })), {})
    nat_gateway = optional(map(object({
      nat_gateway_name = string
      destination      = string
    })), {})
  })
  default = {}
}

variable "route_tables" {
  description = "The names of the route tables to create."
  type        = list(string)
  default     = []
}

variable "vpc" {
  description = "Configuration for the VPC."
  type = object({
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, false)
  })
}
