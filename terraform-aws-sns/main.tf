resource "aws_sns_topic" "this" {
  name              = var.name
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  fifo_topic        = var.fifo_topic
  tags              = { "Name" = var.name }
}