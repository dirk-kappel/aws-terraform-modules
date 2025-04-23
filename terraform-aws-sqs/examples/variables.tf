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
  default = null
}

variable "created_by" {
  type    = string
  default = "Terraform"
}

variable "cost_center" {
  type    = string
  default = "Module Testing"
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "owner" {
  type    = string
  default = "DevOps"
}
