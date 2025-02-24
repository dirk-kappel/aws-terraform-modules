variable "assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role."
  type        = string
  default     = ""
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile alongside the role."
  type        = bool
  default     = false
}

variable "custom_managed_policy_arn" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
  type        = list(string)
  default     = []
}

variable "description" {
  description = "The description of the role."
  default     = ""
  type        = string
}

variable "force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it. Defaults to false."
  type        = bool
  default     = false
}

variable "inline_policies" {
  description = "Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Terraform will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies added out of band on apply."
  type        = string
  default     = ""
}

variable "inline_policy_content" {
  description = "Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. See below. If no blocks are configured, Terraform will not manage any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies added out of band on apply."
  type        = map(string)
  default     = {}
}

variable "managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
  type        = list(string)
  default     = []
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
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
  default     = ""
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
