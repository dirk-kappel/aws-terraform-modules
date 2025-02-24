output "example_project_id" {
  description = "The ID of the example project."
  value       = tfe_project.example.id
}

output "workspace_id" {
  description = "The example workspace ID."
  value       = module.tfc_workspace.workspace_id
}

output "workspace_html_url" {
  description = "The URL to the browsable HTML overview of the example workspace."
  value       = module.tfc_workspace.workspace_html_url
}
