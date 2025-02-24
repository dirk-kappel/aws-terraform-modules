# data "hcp_packer_artifact" "GRANTS-SERVER" {
#   bucket_name  = "GRANTS-SERVER"
#   channel_name = "dev"
#   platform     = "aws"
#   region       = var.aws_region
# }

module "ec2" {
  source = "../"

  # ami                               = data.hcp_packer_artifact.GRANTS-SERVER.external_identifier
  ami                               = "ami-066784287e358dad1"
  associate_public_ip_address       = true
  enable_resource_name_dns_a_record = true
  iam_instance_profile              = "SSM_for_EC2"
  instance_type                     = "t2.micro"
  key_name                          = "ix_vsrx_key_pair_us_east_1"
  subnet_id                         = "subnet-0827396805d8d04f8"
#   user_data                         = <<-EOF
# #!/bin/bash
# # Update /etc/resolv.conf with new nameservers
# cat > /etc/resolv.conf <<EOL
# nameserver 8.8.8.8
# nameserver 8.8.4.4
# # Test successful
# EOL
# EOF
  user_data = file("resolv.sh")
  vpc_security_group_ids            = ["sg-0d7227a1f7c4bb8d6"]

  tags = {
    Name = "example-terraform-server"
  }
}
