variable "egress_rules" {
  description = "A map of egress rules to add to the security group."
  type = map(object({
    cidr_ipv4                    = optional(string)
    rule_description             = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = string
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    to_port                      = optional(number)
  }))
  default = {}
}

variable "ingress_rules" {
  description = "A map of ingress rules to add to the security group."
  type = map(object({
    cidr_ipv4                    = optional(string)
    rule_description             = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = string
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    to_port                      = optional(number)
  }))
  default = {}
}

variable "security_group_description" {
  description = "The description of the security group."
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "The name of the security group."
  type        = string
  default     = null
}

variable "security_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC to create the security group in."
  type        = string
  default     = null
}