variable "ami" {
  description = "The AMI to use for the instance."
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_a_record" {
  description = "Whether to enable DNS hostname for the instance."
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = " Instance type to use for the instance."
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
  default     = ""
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
}