<!-- BEGIN_TF_DOCS -->

# TFC Workspace module

Terraform module which creates Workspace resources in Terraform Cloud.

## Usage
```hcl
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
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Resources

| Name | Type |
|------|------|
| [tfe_variable.environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.region](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region for resources. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for the deployment (dev, stage, prod). | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The id of the Terraform Cloud project | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The Terraform Cloud organization to use. | `string` | n/a | yes |
| <a name="input_vcs_provider_name"></a> [vcs\_provider\_name](#input\_vcs\_provider\_name) | The VCS provider name. | `string` | n/a | yes |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | The VCS repo branch of the Terraform Cloud workspace | <pre>object({<br>    identifier = string<br>    branch     = optional(string, "main")<br>  })</pre> | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | The name of the Terraform Cloud workspace | `string` | n/a | yes |
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether destroy plans are allowed for this workspace | `bool` | `false` | no |
| <a name="input_assessments_enabled"></a> [assessments\_enabled](#input\_assessments\_enabled) | Whether Sentinel policy checks are enabled for this workspace | `bool` | `false` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a run completes | `bool` | `false` | no |
| <a name="input_auto_apply_run_trigger"></a> [auto\_apply\_run\_trigger](#input\_auto\_apply\_run\_trigger) | Whether to automatically apply changes when a run completes | `bool` | `false` | no |
| <a name="input_file_triggers_enabled"></a> [file\_triggers\_enabled](#input\_file\_triggers\_enabled) | Whether file triggers are enabled for this workspace | `bool` | `true` | no |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | Whether to use global remote state for this workspace | `bool` | `false` | no |
| <a name="input_queue_all_runs"></a> [queue\_all\_runs](#input\_queue\_all\_runs) | Whether to queue all runs for this workspace | `bool` | `false` | no |
| <a name="input_remote_consumers"></a> [remote\_consumers](#input\_remote\_consumers) | The names of the remote state consumers | `list(string)` | `[]` | no |
| <a name="input_tag_names"></a> [tag\_names](#input\_tag\_names) | The tags of the Terraform Cloud workspace | `list(string)` | `[]` | no |
| <a name="input_trigger_patterns"></a> [trigger\_patterns](#input\_trigger\_patterns) | The trigger patterns of the Terraform Cloud workspace | `list(string)` | `[]` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The working directory of the Terraform Cloud workspace | `string` | `"/"` | no |
| <a name="input_workspace_description"></a> [workspace\_description](#input\_workspace\_description) | The description of the Terraform Cloud workspace | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_html_url"></a> [workspace\_html\_url](#output\_workspace\_html\_url) | The URL to the browsable HTML overview of the workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The workspace ID. |

<!-- END_TF_DOCS -->