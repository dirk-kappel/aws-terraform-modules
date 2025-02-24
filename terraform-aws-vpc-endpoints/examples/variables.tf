#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "route_table_ids" {
  type = list(string)
}

variable "security_group_vpce_ids" {
  type = list(string)
}

variable "subnet_ids" {
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
  default = "Test VPC Endpoint Module"
}

variable "cost_center" {
  type    = string
  default = "Terraform Testing"
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
