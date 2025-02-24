output "workspace_id" {
  description = "The workspace ID."
  value       = tfe_workspace.this.id
}

output "workspace_html_url" {
  description = "The URL to the browsable HTML overview of the workspace."
  value       = tfe_workspace.this.html_url
}
