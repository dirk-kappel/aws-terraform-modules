variable "deletion_window_in_days" {
  description = <<-EOT
    The waiting period, specified in number of days. After the waiting 
    period ends, AWS KMS deletes the KMS key. If you specify a value, 
    it must be between 7 and 30, inclusive. If you do not specify a 
    value, it defaults to 30.
    EOT
  default     = null
}

variable "description" {
  description = "The description of the key as viewed in AWS console. Defaults to 'Managed by Terraform'."
  type        = string
  default     = null
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "key_alias" {
  description = "The display name of the alias. The name must start with the word alias followed by a forward slash (alias/)."
  type        = string
}

variable "multi_region" {
  description = <<-EOT
    Specifies whether the KMS key is a multi-Region key. You can create 
    a symmetric or asymmetric multi-Region key, and you can create a 
    multi-Region key with imported key material. You cannot create a 
    multi-Region alias key or a multi-Region key in a custom key store.
    EOT
  type        = bool
  default     = null
}

variable "rotation_period_in_days" {
  description = "Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive)."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the object."
  type        = map(any)
  default     = {}
}