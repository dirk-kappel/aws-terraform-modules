variable "access_logs_bucket" {
  description = "The S3 bucket name to store the logs in."
  type        = string
  default     = ""
}

variable "access_logs_enabled" {
  description = "If true, access logs will be enabled."
  type        = bool
  default     = false
}

variable "access_logs_prefix" {
  description = "The prefix to use for the bucket."
  type        = string
  default     = ""
}

variable "lb_dns_record_client_routing_policy" {
  description = "The routing policy for the DNS record associated with the LB."
  type        = string
  default     = null
}

variable "lb_drop_invalid_header_fields" {
  description = "If true, invalid header fields will be dropped."
  type        = bool
  default     = false
}

variable "lb_enable_cross_zone_load_balancing" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled."
  type        = bool
  default     = false
}

variable "lb_enable_http2" {
  description = "If true, the LB will support HTTP/2."
  type        = bool
  default     = false
}

variable "lb_enable_deletion_protection" {
  description = "If true, deletion protection will be enabled for the LB."
  type        = bool
  default     = false
}

variable "lb_internal" {
  description = "If true, the LB will be internal."
  type        = string
  default     = false
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
}

variable "lb_redirects" {
  description = "The values for the redirect block."
  type = list(object({
    listener_port        = number
    listener_protocol    = string
    redirect_port        = number
    redirect_protocol    = string
    redirect_status_code = string
  }))
  default = []
}

variable "lb_subnets" {
  description = "A list of subnet IDs to attach to the LB."
  type        = list(string)
}

variable "lb_type" {
  description = "The type of load balancer."
}

variable "lb_listeners" {
  type = list(object({
    listener_port       = number
    target_group_arn    = string
    listener_protocol   = string
    ssl_policy          = optional(string, null)
    certificate_arn     = optional(string, null)
    routing_action_type = string
  }))
}

variable "lb_listener_rules" {
  type = list(object({
    listener_port = number
    priority      = number
    action = object({
      type             = string
      target_group_arn = string
    })
    condition = object({
      field  = string
      values = list(string)
    })
  }))
  default = []
}

variable "lb_xff_header_processing_mode" {
  description = "Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application."
  type        = string
  default     = "append"
}

variable "security_group_ids" {
  description = "A list of security group IDs to attach to the LB."
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}