#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "aws_region" {
  type = string
}

#--------------------------------------------------
# HCP
#--------------------------------------------------

variable "client_id" {
  type    = string
  default = "client_id"
}

variable "client_secret" {
  type    = string
  default = "client_secret"
}

#--------------------------------------------------
# Tags
#--------------------------------------------------

variable "application" {
  type    = string
  default = "EC2 Module Test"
}

variable "cost_center" {
  type    = string
  default = "Dev"
}

variable "created_by" {
  type    = string
  default = "Terraform"
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "owner" {
  type    = string
  default = "DevOps"
}
