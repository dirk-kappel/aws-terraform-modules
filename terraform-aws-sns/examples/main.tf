module "sns" {
  source = "../"

  name              = "example-topic"
  display_name      = "This is an example sns topic."
  fifo_topic        = false
  kms_master_key_id = "alias/aws/sns"
  protocol          = "email"
}