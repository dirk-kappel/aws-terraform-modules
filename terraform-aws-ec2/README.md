<!-- BEGIN_TF_DOCS -->

# AWS Compute/EC2 Instance Terraform module

Terraform module which creates EC2 instances in AWS

# Usage
```hcl
data "hcp_packer_artifact" "GRANTS-SERVER" {
  bucket_name  = "GRANTS-SERVER"
  channel_name = "dev"
  platform     = "aws"
  region       = var.aws_region
}

module "ec2" {
  source  = "app.terraform.io/dmk-tfc-setup-sandbox/ec2/aws"
  version = "0.0.0"

  ami                         = data.hcp_packer_artifact.GRANTS-SERVER.external_identifier
  associate_public_ip_address = false
  iam_instance_profile        = "SSM_for_EC2"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0827396805d8d04f8"
  vpc_security_group_ids      = ["sg-058acd1f05fbb0392"]

  tags = {
    Name = "dev-grants-server"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI to use for the instance. | `any` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate a public IP address with an instance in a VPC. | `bool` | n/a | yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID to launch the instance in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to associate with. | `list(string)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | The ARN of the instance. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the instance. |
| <a name="output_primary_network_interface_id"></a> [primary\_network\_interface\_id](#output\_primary\_network\_interface\_id) | The ID of the instance's primary network interface. |
### Footer
<!-- END_TF_DOCS -->