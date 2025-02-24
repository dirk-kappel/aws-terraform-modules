# Manages teams.
resource "tfe_team" "this" {
  name         = "this-team"
  organization = var.organization_name
}

# Associate a team to permissions on a workspace.
resource "tfe_team_access" "this" {
  access       = "read"
  team_id      = tfe_team.this.id
  workspace_id = data.tfe_workspace.this.id
}

# Associate a team to permissions on a project.
resource "tfe_team_project_access" "admin" {
  access     = "admin"
  team_id    = tfe_team.this.id
  project_id = data.tfe_project.this.id
}

data "tfe_project" "this" {
  name         = var.tfc_project_name
  organization = var.organization_name
}

data "tfe_workspace" "this" {
  name         = var.workspace_name
  organization = var.organization_name
}