resource "tfe_project" "test" {
  organization = var.tfc_organization
  name         = var.tfc_project.name
  description  = var.tfc_project.description
}