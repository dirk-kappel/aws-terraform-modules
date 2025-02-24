variable "environment" {
  description = "Specifies the deployment environment for the resources. Accepted values are 'dev', 'stage', or 'prod'."
  type        = string
  default     = null
}

variable "gateway_vpc_endpoints" {
  type = map(object({
    policy          = optional(string, null)
    route_table_ids = list(string)
  }))
  description = <<-EOT
    A map of Gateway VPC Endpoints to provision into the VPC. This is a map of objects with the following attributes:
    - `policy` = A policy (as JSON string) to attach to the endpoint that controls access to the service. May be `null` for full access.
    - `route_table_ids`: List of route tables to associate the gateway with. Routes to the gateway
      will be automatically added to these route tables.
    EOT
  default     = {}
}

variable "interface_vpc_endpoints" {
  type = map(object({
    policy              = optional(string, null)
    private_dns_enabled = bool
    vpce_sg_ids         = list(string)
    subnet_ids          = list(string)
  }))
  description = <<-EOT
    A map of Interface VPC Endpoints to provision into the VPC.
    This is a map of objects with the following attributes:
    - `policy`: A policy (as JSON string) to attach to the endpoint that controls access to the service. May be `null` for full access.
    - `private_dns_enabled`: Set `true` to associate a private hosted zone with the specified VPC
    - `security_group_ids`: The ID of one or more security groups to associate with the network interface. The first
      security group will replace the default association with the VPC's default security group. If you want
      to maintain the association with the default security group, either leave `security_group_ids` empty or
      include the default security group ID in the list.
    - `subnet_ids`: List of subnet in which to install the endpoints.
   EOT
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}