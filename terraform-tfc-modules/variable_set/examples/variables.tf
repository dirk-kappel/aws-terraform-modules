#--------------------------------------------------
# TFC
#--------------------------------------------------

variable "tfc_organization" {
  description = "The Terraform Cloud organization to use."
  type        = string
}

variable "tfc_token" {
  description = "The Terraform Cloud token to use. Create team token in TFC."
  type        = string
}

variable "variable_set_1" {
  description = "TFC Module Variable Set 1 configuration"
  type = object({
    name        = string
    description = string
    workspaces  = list(string)
    variables = map(object({
      name        = string
      description = string
      key         = string
      value       = string
      category    = string
    }))
  })
}
