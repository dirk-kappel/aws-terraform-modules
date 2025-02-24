#--------------------------------------------------
# AWS Provider
#--------------------------------------------------

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#--------------------------------------------------
# AWS
#--------------------------------------------------

variable "example_role" {
  description = "Role configuration for network operations"
  type = object({
    managed_policy_arns = list(string)
    role_path           = string
    role_description    = string
    role_name           = string
    trust_relationship = object({
      actions = list(string)
      conditions = list(object({
        test     = string
        variable = string
        values   = list(string)
      }))
      effect = string
      principals = list(object({
        type        = string
        identifiers = list(string)
      }))
    })
  })
}

variable "example_policy" {
  description = "Policy configuration for network operations"
  type = object({
    policy_name        = string
    policy_path        = string
    policy_description = string
    statements = list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    }))
  })
}

#--------------------------------------------------
# DEFAULT TAGS
#--------------------------------------------------

variable "application" {
  type    = string
  default = "TFC IAM"
}

variable "environment" {
  type    = string
  default = "Global"
}

variable "cost_center" {
  type    = string
  default = "Dev Terraform"
}

variable "managed_by" {
  type    = string
  default = "Terraform"
}

variable "owner" {
  type    = string
  default = "DevOps"
}

variable "tfc_project" {
  type    = string
  default = "terraform-cloud"
}

variable "tfc_workspace" {
  type    = string
  default = "dev-global-iam-tfc-roles"
}
