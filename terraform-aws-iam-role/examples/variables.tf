#--------------------------------------------------
# AWS Provider
#--------------------------------------------------

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#--------------------------------------------------
# DEFAULT TAGS
#--------------------------------------------------

variable "application" {
  type    = string
  default = "tfc iam"
}

variable "environment" {
  type    = string
  default = "testing"
}

variable "owner" {
  type    = string
  default = "devops"
}

variable "tfc_project" {
  type    = string
  default = "terraform-cloud"
}

locals {
  tfc_workspace = "${var.environment}-${var.tfc_project}-${var.aws_region}"
  cost_center   = "${var.environment}-${var.tfc_project}"
}
