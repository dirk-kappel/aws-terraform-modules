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

variable "tfc_workspaces" {
  description = "The Terraform Cloud workspace to use."
  type        = list(string)
}
