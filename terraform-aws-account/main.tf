resource "aws_organizations_account" "account" {
  for_each = var.aws_account

  name              = each.key
  email             = each.value.account_email
  create_govcloud   = each.value.create_govcloud
  close_on_deletion = var.close_on_deletion
}