#--------------------------------------------------
# TFC VARIABLE SETS
#--------------------------------------------------
module "example_tfc_variable_set" {
  source = "../"

  tfc_organization = var.tfc_organization
  variable_set = {
    name        = "TFC_Module_Variable_Set"
    description = "TFC Module Variable Set Description"
    workspaces  = var.tfc_workspaces
    variables = {
      "example_variable_key_1" = {
        description = "example variable 1 description"
        value       = "example value 1"
        category    = "env"
      }
      "example_variable_key_2" = {
        description = "example variable 2 description"
        value       = "example value 2"
        category    = "env"
      }
    }
  }
}

