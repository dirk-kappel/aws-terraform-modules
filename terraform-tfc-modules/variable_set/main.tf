#--------------------------------------------------
# TFC VARIABLE SETS
#--------------------------------------------------

data "tfe_workspace_ids" "tfc_workspace" {
  count = var.variable_set.workspaces != null ? 1 : 0

  names        = var.variable_set.workspaces
  organization = var.tfc_organization
}

resource "tfe_variable_set" "this" {
  count = var.variable_set.name != null ? 1 : 0

  name         = var.variable_set.name
  description  = var.variable_set.description
  organization = var.tfc_organization
}

resource "tfe_workspace_variable_set" "this" {
  for_each = length(data.tfe_workspace_ids.tfc_workspace[0].ids) > 0 ? data.tfe_workspace_ids.tfc_workspace[0].ids : {}

  variable_set_id = tfe_variable_set.this[0].id
  workspace_id    = each.value
}

resource "tfe_variable" "this" {
  for_each = var.variable_set.variables

  key             = each.value.key
  value           = each.value.value
  category        = each.value.category
  description     = each.value.description
  hcl             = each.value.hcl
  sensitive       = each.value.sensitive
  variable_set_id = tfe_variable_set.this[0].id
}
