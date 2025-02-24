<!-- BEGIN_TF_DOCS -->

# TFC Variable Set module

Terraform module which creates Variable Set resources in Terraform Cloud.

## Usage
```hcl
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
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | TFC Module Variable Set configuration. | <pre>object({<br>    name        = string<br>    description = optional(string, "")<br>    workspaces  = optional(list(string), [])<br>    variables = map(object({<br>      description = optional(string)<br>      hcl         = optional(bool, false)<br>      sensitive   = optional(bool, false)<br>      value       = string<br>      category    = string<br>    }))<br>  })</pre> | <pre>{<br>  "name": "",<br>  "variables": {}<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_variable_set_id"></a> [variable\_set\_id](#output\_variable\_set\_id) | The ID of the TFC Variable Set. |

<!-- END_TF_DOCS -->