variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

#--------------------------------------------------
# Tags
#--------------------------------------------------

variable "application" {
  type    = string
  default = ""
}

variable "confidentiality" {
  type    = string
  default = ""
}

variable "cost_center" {
  type    = string
  default = ""
}

variable "created_by" {
  type    = string
  default = "Terraform"
}

variable "environment" {
  type    = string
  default = ""
}

variable "owner" {
  type    = string
  default = ""
}

variable "project" {
  type    = string
  default = ""
}

#----------------------------------------------------
# SNS MODULE
#----------------------------------------------------


variable "fifo_topic" {
  description = "Set to true to create a FIFO topic."
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
  default     = ""
}

variable "protocol" {
  description = "The protocol you want to use. Supported protocols include: http, https, email, email-json, sms, sqs, application, lambda. Protocols email, email-json, http and https are also valid but partially supported."
  default     = "email"
}

variable "sns_topic_display_name" {
  description = "The display name for the SNS topic."
  default     = ""
}

variable "sns_topic_name" {
  description = "The name of the SNS topic."
}