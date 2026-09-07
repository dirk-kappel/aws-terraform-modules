output "aws_organizations_account" {
  value = {
    for k, v in aws_organizations_account.account : k => {
      id          = v.id
      govcloud_id = v.govcloud_id != "" ? v.govcloud_id : null
    }
  }
}