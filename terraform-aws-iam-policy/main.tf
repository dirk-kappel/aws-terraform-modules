# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/IAM/latest/UserGuide/iam-ug.pdf
#
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
#
# IAM POLICY
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
#
# ----------------------------------------------------------------------------------------------------

resource "aws_iam_policy" "this" {
  policy = data.aws_iam_policy_document.this.json

  description = var.description
  name        = var.name
  name_prefix = var.name_prefix
  path        = var.path
  tags        = var.tags

  lifecycle {
    create_before_destroy = false
  }
}

data "aws_iam_policy_document" "this" {

  dynamic "statement" {
    for_each = var.statements

    content {
      sid    = statement.value.sid
      effect = statement.value.effect

      actions     = statement.value.actions
      not_actions = statement.value.not_actions

      resources     = statement.value.resources
      not_resources = statement.value.not_resources

      dynamic "condition" {
        for_each = statement.value.conditions

        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }

      dynamic "principals" {
        for_each = statement.value.principals

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }
    }
  }
}
