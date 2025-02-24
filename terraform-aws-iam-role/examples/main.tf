module "iam_role" {
  source = "../"

  create_instance_profile   = true
  description               = "Allows EC2 instances to call AWS services on your behalf."
  custom_managed_policy_arn = []
  managed_policy_arns       = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration      = 3600
  name                      = "TestRole"
  trust_relationship = {
    actions = ["sts:AssumeRole"]
    conditions = [
      {
        test     = "StringEquals"
        variable = "ec2:ResourceTag/Name"
        values   = ["My Tag Value"]
      },
      {
        test     = "StringLike"
        variable = "ec2:ResourceTag/Name"
        values   = ["*production*"]
      }
    ]
    effect = "Allow"
    principals = [
      {
        type        = "Service"
        identifiers = ["ec2.amazonaws.com"]
      }
    ]
  }
}
