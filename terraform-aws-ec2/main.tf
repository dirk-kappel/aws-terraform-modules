#----------------------------------------------------------------------------------------------------
#
# AWS DOCUMENTATION
#
# https://docs.aws.amazon.com/pdfs/AWSEC2/latest/UserGuide/ec2-ug.pdf
#
#----------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------
#
# AWS INSTANCE
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#
#---------------------------------------------------------------------------------------------------- 

resource "aws_instance" "this" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  iam_instance_profile        = var.iam_instance_profile
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  tags                        = var.tags
  user_data                   = var.user_data
  volume_tags                 = var.tags
  vpc_security_group_ids      = var.vpc_security_group_ids

  private_dns_name_options {
    enable_resource_name_dns_a_record = var.private_dns_name_options.enable_resource_name_dns_a_record
    hostname_type                     = var.private_dns_name_options.hostname_type
  }

  root_block_device {
    delete_on_termination = var.root_block_device.delete_on_termination
    encrypted             = var.root_block_device.encrypted
    kms_key_id            = var.root_block_device.kms_key_id
    volume_size           = var.root_block_device.volume_size
    volume_type           = var.root_block_device.volume_type
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device

    content {
      delete_on_termination = ebs_block_device.value.delete_on_termination
      device_name           = ebs_block_device.key
      encrypted             = ebs_block_device.value.encrypted
      kms_key_id            = ebs_block_device.value.kms_key_id
      snapshot_id           = ebs_block_device.value.snapshot_id
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
    }
  }
}

#----------------------------------------------------------------------------------------------------
#
# AWS EIP
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
#
#---------------------------------------------------------------------------------------------------- 

resource "aws_eip" "this" {
  count = var.associate_public_ip_address ? 1 : 0

  instance = aws_instance.this.id
  domain   = "vpc"
  tags     = var.tags
}
