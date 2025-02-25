# ----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/kms/latest/developerguide/kms-dg.pdf
#
# ----------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------
#
# KMS KEY
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy
#
# ----------------------------------------------------------------------------------------------------

resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  rotation_period_in_days = var.rotation_period_in_days
  multi_region            = var.multi_region
  tags                    = var.tags
}

resource "aws_kms_alias" "this" {
  name_prefix   = var.key_alias
  target_key_id = aws_kms_key.this.key_id
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.id
  policy = jsonencode({
    Id = "example"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}