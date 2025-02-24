module "tfc_example_role" {
  source = "../../"

  description               = var.example_role.role_description
  custom_managed_policy_arn = [module.tfc_example_policy.policy_arn]
  managed_policy_arns       = var.example_role.managed_policy_arns
  name                      = var.example_role.role_name
  path                      = var.example_role.role_path
  trust_relationship        = var.example_role.trust_relationship
}

module "tfc_example_policy" {
  source = "../../../terraform-aws-iam-policy"

  description = var.example_policy.policy_description
  name        = var.example_policy.policy_name
  path        = var.example_policy.policy_path
  statements  = var.example_policy.statements
}

