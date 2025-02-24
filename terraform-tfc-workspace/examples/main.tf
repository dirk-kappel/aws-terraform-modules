module "tfc_workspace" {
  source = "../"

  allow_destroy_plan    = true
  aws_region            = "us-east-2"
  environment           = "dev"
  tfc_organization      = var.tfc_organization
  tag_names             = ["example_tag", "module_testing"]
  workspace_name        = "tfc_example_workspace"
  workspace_description = "a simple description"
  remote_consumers      = []
  project_id            = tfe_project.example.id
  trigger_patterns      = ["/path/to/trigger/*.tf"]
  vcs_provider_name     = var.vcs_provider_name
  vcs_repo = {
    identifier = var.vcs_repo_identifier
    branch     = "main"
  }
  working_directory = "path/to/working/directory"
}

resource "tfe_project" "example" {
  organization = var.tfc_organization
  name         = "example"
  description  = "example project in tfc."
}