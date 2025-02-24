variable "display_name" {
  description = "The display name for the SNS topic."
  type        = string
  default     = ""
}

variable "fifo_topic" {
  description = "Set to true to create a FIFO topic."
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
  default     = "alias/aws/sns"
}

variable "name" {
  description = "The name of the topic."
  type        = string
}

variable "protocol" {
  description = "The protocol you want to use. Supported protocols include: http, https, email, email-json, sms, sqs, application, lambda. Protocols email, email-json, http and https are also valid but partially supported."
  default     = "email"
}
