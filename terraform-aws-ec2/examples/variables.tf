#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "aws_region" {
  type = string
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_id" {
  type = string
}

variable "instance_profile" {
  type = string
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
