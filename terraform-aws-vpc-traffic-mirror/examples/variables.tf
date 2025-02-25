variable "aws_region" {
  description = "The region where the resources are being deployed."
  type        = string
}

variable "source_eni" {
  description = "ID of the source network interface. Not all network interfaces are eligible as mirror sources. On EC2 instances only nitro based instances support mirroring."
  type        = string
}

variable "target_eni" {
  description = "The network interface ID that is associated with the target."
  type        = string
}
