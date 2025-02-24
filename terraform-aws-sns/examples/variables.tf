variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "account_id" {
  type = string
}

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
