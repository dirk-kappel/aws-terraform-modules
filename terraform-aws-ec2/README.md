<!-- BEGIN_TF_DOCS -->

# AWS EC2 Terraform module

Terraform module which creates EC2 instance and EIP resources in AWS

## Usage
```hcl
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
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI to use for the instance. | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID to launch the instance in. | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate a public IP address with an instance in a VPC. | `bool` | `false` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in. | `string` | `null` | no |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | One or more configuration blocks with additional EBS block devices to attach <br>to the instance. Block device configurations only apply on resource creation. | <pre>map(object({<br>    delete_on_termination = optional(bool, true)    # Whether the volume should be destroyed on instance termination.<br>    encrypted             = optional(bool, true)    # Whether to enable volume encryption.<br>    kms_key_id            = optional(string, null)  # Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. <br>    snapshot_id           = optional(string, null)  # Snapshot ID to mount.<br>    volume_size           = optional(string, null)  # Size of the volume in gibibytes (GiB).<br>    volume_type           = optional(string, "gp3") # Type of volume.<br>  }))</pre> | `{}` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Instance Profile to launch the instance with. Specified as the <br>name of the Instance Profile. Ensure your credentials have the <br>correct permission to assign the instance profile according to the <br>EC2 documentation, notably iam:PassRole. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name to use for the instance. | `string` | `null` | no |
| <a name="input_private_dns_name_options"></a> [private\_dns\_name\_options](#input\_private\_dns\_name\_options) | Options for the instance hostname. The default values are inherited from the subnet. | <pre>object({<br>    enable_resource_name_dns_a_record = optional(bool, true)        # Indicates whether to respond to DNS queries for instance hostnames with DNS A records.<br>    hostname_type                     = optional(string, "ip-name") # Type of hostname for Amazon EC2 instances.<br>  })</pre> | `{}` | no |
| <a name="input_root_block_device"></a> [root\_block\_device](#input\_root\_block\_device) | Configuration block to customize details about the root block device of the instance. | <pre>object({<br>    delete_on_termination = optional(bool, true)    # Whether the volume should be destroyed on instance termination.<br>    encrypted             = optional(bool, false)   # Whether to enable volume encryption.<br>    kms_key_id            = optional(string, null)  # Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. <br>    volume_size           = optional(string, null)  # Size of the volume in gibibytes (GiB).<br>    volume_type           = optional(string, "gp3") # Type of volume.<br>  })</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to provide when launching the instance. | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to associate with. | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_arn"></a> [instance\_arn](#output\_instance\_arn) | The ARN of the instance. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the instance. |
| <a name="output_primary_network_interface_id"></a> [primary\_network\_interface\_id](#output\_primary\_network\_interface\_id) | The ID of the instance's primary network interface. |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | The public DNS associated with the elastic IP address, if applicable. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address assigned to the elastic IP, if applicable. |

<!-- END_TF_DOCS -->