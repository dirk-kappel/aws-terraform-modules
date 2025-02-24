#--------------------------------------------------
# TFC
#--------------------------------------------------

variable "tfc_organization" {
  description = "The Terraform Cloud organization to use."
  type        = string
}

variable "tfc_project" {
  description = "The VCS provider name."
  type = object({
    name        = string
    description = optional(string)
  })
}