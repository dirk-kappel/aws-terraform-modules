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