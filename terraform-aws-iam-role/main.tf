resource "aws_iam_role" "this" {
  assume_role_policy   = data.aws_iam_policy_document.instance_assume_role_policy.json
  description          = var.description
  max_session_duration = var.max_session_duration
  name                 = var.name
  name_prefix          = var.name_prefix
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags

  dynamic "inline_policy" {
    for_each = var.inline_policy_content

    content {
      name   = inline_policy.key
      policy = inline_policy.value
    }
  }
}

resource "aws_iam_instance_profile" "this" {
  count       = var.create_instance_profile ? 1 : 0
  name        = var.name
  name_prefix = var.name_prefix
  path        = var.path
  role        = aws_iam_role.this.name
  tags        = var.tags
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = var.trust_relationship.actions
    effect  = var.trust_relationship.effect

    dynamic "condition" {
      for_each = var.trust_relationship.conditions
      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }

    dynamic "principals" {
      for_each = var.trust_relationship.principals
      content {
        type        = principals.value.type
        identifiers = principals.value.identifiers
      }
    }
  }
}

resource "aws_iam_role_policy_attachment" "custom" {
  for_each   = var.custom_managed_policy_arn != [] ? { for idx, policy_arn in var.custom_managed_policy_arn : idx => policy_arn } : {}
  role       = aws_iam_role.this.name
  policy_arn = each.value

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = var.managed_policy_arns != [] ? { for idx, policy_arn in var.managed_policy_arns : idx => policy_arn } : {}
  role       = aws_iam_role.this.name
  policy_arn = each.value

  lifecycle {
    create_before_destroy = false
  }
}