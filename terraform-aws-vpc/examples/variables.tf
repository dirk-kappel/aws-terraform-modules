#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "aws_profile" {}

variable "aws_region" {}

variable "flow_log_role_arn" {
  description = "The ARN of the IAM role that will publish flow logs to CloudWatch Logs."
}

#--------------------------------------------------
# DEFAULT TAGS
#--------------------------------------------------

variable "application" {
  type    = string
  default = "example-network-infrastructure"
}

variable "environment" {
  type = string
}

variable "owner" {
  type    = string
  default = "devops"
}

variable "tfc_project" {
  type    = string
  default = "network"
}

locals {
  tfc_workspace = "${var.environment}-${var.tfc_project}-${var.aws_region}"
  cost_center   = "${var.environment}-${var.tfc_project}"
}