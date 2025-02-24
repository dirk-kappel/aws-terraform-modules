#--------------------------------------------------
# TFC
#--------------------------------------------------

variable "tfc_organization" {
  description = "The Terraform Cloud organization to use."
  type        = string
}

variable "variable_set" {
  description = "TFC Module Variable Set configuration."
  type = object({
    name        = string
    description = optional(string, "")
    workspaces  = optional(list(string), [])
    variables = map(object({
      name        = string
      description = optional(string)
      hcl         = optional(bool, false)
      sensitive   = optional(bool, false)
      key         = string
      value       = string
      category    = string
    }))
  })
  default = {
    name      = ""
    variables = {}
  }
}