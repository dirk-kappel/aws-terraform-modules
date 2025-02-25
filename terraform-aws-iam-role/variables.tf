variable "assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role."
  type        = string
  default     = null
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile alongside the role."
  type        = bool
  default     = false
}

variable "custom_managed_policy_arn" {
  description = <<-EOT
    Set of exclusive IAM managed policy ARNs to attach to the IAM role. 
    If this attribute is not configured, Terraform will ignore policy attachments 
    to this resource. When configured, Terraform will align the role's managed policy 
    attachments with this set by attaching or detaching managed policies. 
    Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform 
    to remove all managed policy attachments.
    EOT
  type        = list(string)
  default     = []
}

variable "description" {
  description = "The description of the role."
  type        = string
  default     = null
}

variable "force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it. Defaults to false."
  type        = bool
  default     = null
}

variable "managed_policy_arns" {
  description = <<-EOT
    Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute 
    is not configured, Terraform will ignore policy attachments to this resource. When 
    configured, Terraform will align the role's managed policy attachments with this set 
    by attaching or detaching managed policies. Configuring an empty set 
    (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments.
    EOT
  type        = list(string)
  default     = []
}

variable "max_session_duration" {
  description = <<EOT
    The maximum session duration (in seconds) that you want to set for 
    the specified role. This setting can have a value from 1 hour to 12 hours.
    EOT
  type        = number
  default     = 3600
}

variable "name" {
  description = "The name of the role."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "path" {
  description = "The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide."
  type        = string
  default     = "/"
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "principal_service" {
  description = "The value for the principal services in the assume role policy"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(string)
  default     = {}
}

variable "trust_relationship" {
  description = "The trust relationship to apply to the role."
  type = object({
    actions = optional(list(string), [])
    conditions = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })), [])
    effect = optional(string, "")
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })), [])
    resources = optional(list(string), [])
  })
}
