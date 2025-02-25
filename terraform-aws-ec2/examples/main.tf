module "ec2" {
  source = "../"

  ami                         = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = var.instance_profile
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.vpc_security_group_id]

  private_dns_name_options = {
    enable_resource_name_dns_a_record = true
  }

  root_block_device = {
    encrypted = true
  }

  ebs_block_device = {
    "/dev/sdb" = {
      encrypted   = false
      volume_size = 11
    },
    "/dev/sdc" = {
      volume_size = 19
    }
  }

  tags = {
    Name = "example-terraform-server"
  }
}
