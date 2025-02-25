variable "egress_filter_rules" {
  description = "Optional map of egress traffic mirror filter rules"
  type = map(object({
    rule_description       = optional(string, "Egress filter rule")
    destination_cidr_block = string
    source_cidr_block      = string
    rule_number            = number
    rule_action            = string
    rule_protocol          = optional(number, null)
    dst_from_port          = optional(number, null)
    dst_to_port            = optional(number, null)
    src_from_port          = optional(number, null)
    src_to_port            = optional(number, null)
  }))
  default = {}
}

variable "ingress_filter_rules" {
  description = "Optional map of ingress traffic mirror filter rules"
  type = map(object({
    rule_description       = optional(string, "Ingress filter rule")
    destination_cidr_block = string
    source_cidr_block      = string
    rule_number            = number
    rule_action            = string
    rule_protocol          = optional(number, null)
    dst_from_port          = optional(number, null)
    dst_to_port            = optional(number, null)
    src_from_port          = optional(number, null)
    src_to_port            = optional(number, null)
  }))
  default = {}
}

variable "mirror_filter_description" {
  description = "A description of the filter."
  type        = string
  default     = null
}

variable "mirror_network_services" {
  description = "List of amazon network services that should be mirrored. Valid values: amazon-dns."
  type        = list(string)
  default     = null
}

variable "mirror_target_description" {
  description = "A description of the traffic mirror target."
  type        = string
  default     = null
}

variable "packet_length" {
  description = <<EOT
The number of bytes in each packet to mirror. These are bytes 
after the VXLAN header. Do not specify this parameter when 
you want to mirror the entire packet. To mirror a subset of 
the packet, set this to the length (in bytes) that you want to mirror.
EOT
  type        = number
  default     = null
}

variable "session_description" {
  description = "A description of the traffic mirror session."
  type        = string
  default     = null
}

variable "session_number" {
  description = <<EOT
The session number determines the order in which sessions are 
evaluated when an interface is used by multiple sessions. The 
first session with a matching filter is the one that mirrors the packets.
EOT
  type        = number
}

variable "source_eni" {
  description = <<EOT
ID of the source network interface. Not all network interfaces are 
eligible as mirror sources. On EC2 instances only nitro based 
instances support mirroring.
EOT
  type        = string
}

variable "target_eni" {
  description = "The network interface ID that is associated with the target."
  type        = string
  default     = null
}

variable "target_glb" {
  description = "The VPC Endpoint Id of the Gateway Load Balancer that is associated with the target."
  type        = string
  default     = null
}

variable "target_nlb" {
  description = "The Amazon Resource Name (ARN) of the Network Load Balancer that is associated with the target."
  type        = string
  default     = null
}

variable "virtual_network_id" {
  description = <<EOT
The VXLAN ID for the Traffic Mirror session. For more information 
about the VXLAN protocol, see RFC 7348. If you do not specify a 
VirtualNetworkId, an account-wide unique id is chosen at random.
EOT
  type        = number
  default     = null
}

variable "vpc_traffic_mirror_name" {
  description = "The name tag to apply to the session and mirror resources."
  type        = string
  default     = "VPC Traffic Mirror"
}