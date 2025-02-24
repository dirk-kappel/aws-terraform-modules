variable "allow_destroy_plan" {
  description = "Whether destroy plans are allowed for this workspace"
  type        = bool
  default     = false
}

variable "assessments_enabled" {
  description = "Whether Sentinel policy checks are enabled for this workspace"
  type        = bool
  default     = false
}

variable "aws_region" {
  description = "The AWS region for resources."
  type        = string
}

variable "auto_apply" {
  description = "Whether to automatically apply changes when a run completes"
  type        = bool
  default     = false
}

variable "auto_apply_run_trigger" {
  description = "Whether to automatically apply changes when a run completes"
  type        = bool
  default     = false
}

variable "environment" {
  type        = string
  description = "The environment for the deployment (dev, stage, prod)."

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage, or prod."
  }
}

variable "file_triggers_enabled" {
  description = "Whether file triggers are enabled for this workspace"
  type        = bool
  default     = true
}

variable "queue_all_runs" {
  description = "Whether to queue all runs for this workspace"
  type        = bool
  default     = false
}

variable "remote_consumers" {
  description = "The names of the remote state consumers"
  type        = list(string)
  default     = []
}

variable "tag_names" {
  description = "The tags of the Terraform Cloud workspace"
  type        = list(string)
  default     = []
}

variable "project_id" {
  description = "The id of the Terraform Cloud project"
  type        = string
}

variable "trigger_patterns" {
  description = "The trigger patterns of the Terraform Cloud workspace"
  type        = list(string)
  default     = []
}

variable "vcs_repo" {
  description = "The VCS repo branch of the Terraform Cloud workspace"
  type = object({
    identifier = string
    branch     = optional(string, "main")
  })
}

variable "working_directory" {
  description = "The working directory of the Terraform Cloud workspace"
  type        = string
  default     = "/"
}

variable "workspace_description" {
  description = "The description of the Terraform Cloud workspace"
  type        = string
  default     = ""
}

variable "workspace_name" {
  description = "The name of the Terraform Cloud workspace"
  type        = string
}

#--------------------------------------------------
# TFC
#--------------------------------------------------

variable "tfc_organization" {
  description = "The Terraform Cloud organization to use."
  type        = string
}

variable "vcs_provider_name" {
  description = "The VCS provider name."
  type        = string
}