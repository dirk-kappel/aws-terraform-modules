module "kms" {
  source = "../"

  description             = "Example kms key"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  key_alias               = "alias/myKeyAlias"
  multi_region            = false
}
