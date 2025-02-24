resource "tfe_workspace" "this" {
  name                   = var.workspace_name
  allow_destroy_plan     = var.allow_destroy_plan
  assessments_enabled    = var.assessments_enabled
  auto_apply             = var.auto_apply
  auto_apply_run_trigger = var.auto_apply_run_trigger
  description            = var.workspace_description
  file_triggers_enabled  = var.file_triggers_enabled
  organization           = var.tfc_organization
  project_id             = var.project_id
  queue_all_runs         = var.queue_all_runs
  tag_names              = var.tag_names
  trigger_patterns       = var.trigger_patterns

  vcs_repo {
    identifier     = var.vcs_repo.identifier
    branch         = var.vcs_repo.branch
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }

  working_directory = var.working_directory
}

resource "tfe_workspace_settings" "this" {
  workspace_id              = tfe_workspace.this.id
  remote_state_consumer_ids = var.remote_consumers
}

data "tfe_oauth_client" "client" {
  organization = var.tfc_organization
  name         = var.vcs_provider_name
}

resource "tfe_variable" "region" {
  key          = "aws_region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "AWS Region for resources."
}

resource "tfe_variable" "environment" {
  key          = "environment"
  value        = var.environment
  category     = "terraform"
  workspace_id = tfe_workspace.this.id
  description  = "The environment for the deployment (dev, stage, prod)."
}