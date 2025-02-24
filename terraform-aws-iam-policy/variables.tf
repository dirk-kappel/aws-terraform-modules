variable "description" {
  description = "The description of the created IAM policy."
  default     = ""
  type        = string
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

variable "statements" {
  description = <<-EOT
    IAM policy as list of Terraform objects, compatible with Terraform `aws_iam_policy_document` data source
    except that `source_policy_documents` and `override_policy_documents` are not included.
    Use inputs `iam_source_policy_documents` and `iam_override_policy_documents` for that.
    EOT
  type = list(object({
    sid           = optional(string, null)
    effect        = optional(string, null)
    actions       = optional(list(string), null)
    not_actions   = optional(list(string), null)
    resources     = optional(list(string), null)
    not_resources = optional(list(string), null)
    conditions = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })), [])
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })), [])
    not_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })), [])
  }))
}

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(string)
  default     = {}
}
