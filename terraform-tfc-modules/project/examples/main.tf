module "tfc_project" {
  source = "../"

  tfc_organization = "dmk-tfc-setup-sandbox"
  tfc_project = {
    name        = "test_project_001"
    description = "This is my test project."
  }
}
