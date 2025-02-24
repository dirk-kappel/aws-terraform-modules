#--------------------------------------------------
# TFC VARIABLE SETS
#--------------------------------------------------

module "tfc_variable_set_1" {
  source = "../"

  tfc_organization = "dmk-tfc-setup-sandbox"
  variable_set = {
    name        = "TFC Module Variable Set 1"
    description = "TFC Module Variable Set 1 Description"
    workspaces = [
      "dev-network-us-east-1"
    ]
    variables = {
      "var_1" = {
        name        = "TFC Module Variable Set 1"
        description = "TFC Module Variable Set 1 Description"
        key         = "TFC_MODULE_VAR_1_KEY"
        value       = "TFC Module Variable Set 1 Value"
        category    = "env"
      }
      "var_2" = {
        name        = "TFC Module Variable Set 2"
        description = "TFC Module Variable Set 2 Description"
        key         = "TFC_MODULE_VAR_2_KEY"
        value       = "TFC Module Variable Set 2 Value"
        category    = "env"
      }
    }
  }
}