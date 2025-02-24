#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "aws_profile" {}

variable "aws_region" {}

variable "vpc_id" {}

#--------------------------------------------------
# Tags
#--------------------------------------------------

variable "application" {
  type    = string
  default = null
}

variable "created_by" {
  type    = string
  default = "Terraform"
}

variable "cost_center" {
  type    = string
  default = "Dev"
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "owner" {
  type    = string
  default = "DevOps"
}
