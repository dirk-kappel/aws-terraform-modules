#--------------------------------------------------
# AWS Provider
#--------------------------------------------------

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "alb_certificate_arn" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

#--------------------------------------------------
# Tags
#--------------------------------------------------

variable "application" {
  type    = string
  default = "ELB - TARGET GROUP"
}

variable "cost_center" {
  type    = string
  default = "Terraform Module Testing"
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
