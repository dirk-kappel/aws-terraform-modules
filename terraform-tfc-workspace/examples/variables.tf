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

variable "vcs_repo_identifier" {
  description = "The VCS repository identifier to use."
  type        = string
}

variable "vcs_provider_name" {
  description = "The VCS provider name to use."
  type        = string
}