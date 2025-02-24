module "iam_policy" {
  source = "../"

  name        = "Module_Test_Policy"
  description = "Test policy with allows."
  path        = "/test/"
  statements = [
    {
      actions = [
        "logs:CreateLogGroup",
        "ec2:DescribeAddressesAttribute",
        "rds:CreateDBSubnetGroup",
        "iam:CreateRole"
      ]
      effect    = "Allow"
      resources = ["*"]
    },
    {
      actions = [
        "sns:*"
      ]
      effect    = "Deny"
      resources = ["*"]
    }
  ]
}
