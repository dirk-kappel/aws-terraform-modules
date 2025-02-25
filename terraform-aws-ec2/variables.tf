variable "ami" {
  description = "The AMI to use for the instance."
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "AZ to start the instance in."
  type        = string
  default     = null
}

variable "ebs_block_device" {
  description = <<EOT
One or more configuration blocks with additional EBS block devices to attach 
to the instance. Block device configurations only apply on resource creation.
EOT
  type = map(object({
    delete_on_termination = optional(bool, true)    # Whether the volume should be destroyed on instance termination.
    encrypted             = optional(bool, true)    # Whether to enable volume encryption.
    kms_key_id            = optional(string, null)  # Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. 
    snapshot_id           = optional(string, null)  # Snapshot ID to mount.
    volume_size           = optional(string, null)  # Size of the volume in gibibytes (GiB).
    volume_type           = optional(string, "gp3") # Type of volume.
  }))
  default = {}
}

variable "iam_instance_profile" {
  description = <<EOT
IAM Instance Profile to launch the instance with. Specified as the 
name of the Instance Profile. Ensure your credentials have the 
correct permission to assign the instance profile according to the 
EC2 documentation, notably iam:PassRole.
EOT
  type        = string
  default     = null
}

variable "instance_type" {
  description = " Instance type to use for the instance."
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
  default     = null
}

variable "private_dns_name_options" {
  description = "Options for the instance hostname. The default values are inherited from the subnet."
  type = object({
    enable_resource_name_dns_a_record = optional(bool, true)        # Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    hostname_type                     = optional(string, "ip-name") # Type of hostname for Amazon EC2 instances.
  })
  default = {}
}

variable "root_block_device" {
  description = "Configuration block to customize details about the root block device of the instance."
  type = object({
    delete_on_termination = optional(bool, true)    # Whether the volume should be destroyed on instance termination.
    encrypted             = optional(bool, false)   # Whether to enable volume encryption.
    kms_key_id            = optional(string, null)  # Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. 
    volume_size           = optional(string, null)  # Size of the volume in gibibytes (GiB).
    volume_type           = optional(string, "gp3") # Type of volume.
  })
  default = {}
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in."
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with."
  type        = list(string)
  default     = []
}