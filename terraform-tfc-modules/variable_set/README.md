<!-- BEGIN_TF_DOCS -->

# TFC Variable Set module

Terraform module which creates Variable Set resources in Terraform Cloud.

## Usage
```hcl
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
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Resources

| Name | Type |
|------|------|
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The Terraform Cloud organization to use. | `string` | n/a | yes |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | TFC Module Variable Set configuration. | <pre>object({<br>    name        = string<br>    description = optional(string, "")<br>    workspaces  = optional(list(string), [])<br>    variables = map(object({<br>      name        = string<br>      description = optional(string)<br>      hcl         = optional(bool, false)<br>      sensitive   = optional(bool, false)<br>      key         = string<br>      value       = string<br>      category    = string<br>    }))<br>  })</pre> | <pre>{<br>  "name": "",<br>  "variables": {}<br>}</pre> | no |


<!-- END_TF_DOCS -->