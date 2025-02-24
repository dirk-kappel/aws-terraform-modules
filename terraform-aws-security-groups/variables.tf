variable "description" {
  description = "The description of the security group."
  type        = string
  default     = ""
}

variable "egress_rules" {
  description = "A map of egress rules to add to the security group."
  type = map(object({
    cidr_ipv4                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
    to_port                      = optional(number)
  }))
  default = null
}

variable "environment" {
  description = "Specifies the deployment environment for the resources. Accepted values are 'dev', 'stage', or 'prod'."
  type        = string
  default     = null
}
variable "ingress_rules" {
  description = "A map of ingress rules to add to the security group."
  type = map(object({
    cidr_ipv4                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string)
    referenced_security_group_id = optional(string)
    to_port                      = optional(number)
  }))
  default = null
}

variable "name" {
  description = "The name of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The VPC to create the security group in."
  type        = string
}