resource "aws_instance" "this" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  tags                        = var.tags
  user_data                   = var.user_data
  volume_tags                 = var.tags
  vpc_security_group_ids      = var.vpc_security_group_ids

  private_dns_name_options {
    enable_resource_name_dns_a_record = var.enable_resource_name_dns_a_record
  }
}

resource "aws_eip" "this" {
  count = var.associate_public_ip_address ? 1 : 0

  instance = aws_instance.this.id
  domain   = "vpc"
  tags     = var.tags
}
