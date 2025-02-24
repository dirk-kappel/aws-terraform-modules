variable "create_sns_topic_policy" {
  description = "Whether to create an sns topic policy or not."
  type        = bool
  default     = false
}

variable "display_name" {
  description = "The display name for the SNS topic."
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic. FIFO topics can't deliver messages to customer managed endpoints, such as email addresses, mobile apps, SMS, or HTTP(S) endpoints. These endpoint types aren't guaranteed to preserve strict message ordering."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
  default     = "alias/aws/sns"
}

variable "name" {
  description = "The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "protocol" {
  description = "The protocol you want to use. Supported protocols include: http, https, email, email-json, sms, sqs, application, lambda. Protocols email, email-json, http and https are also valid but partially supported."
  default     = "email"
}

variable "sns_topic_policy_json" {
  description = "The fully-formed AWS policy as JSON."
  type        = string
  default     = null
}
