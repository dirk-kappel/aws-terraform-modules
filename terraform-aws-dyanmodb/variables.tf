# ----------------------------------------------------------------------------------------------------
#
# REQUIRED
#
# ----------------------------------------------------------------------------------------------------
variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes."
  type = list(object({
    name = string
    type = string
  }))
  default = []

  validation {
    condition     = length([for attr in var.attributes : attr if contains(["S", "N", "B"], attr.type)]) == length(var.attributes)
    error_message = "Attribute type must be one of: S (string), N (number), or B (binary)."
  }
}

variable "hash_key" {
  description = "Attribute to use as the hash (partition) key. Must also be defined as an attribute."
  type        = string
}

variable "name" {
  description = "Unique within a region name of the table."
  type        = string
}
# ----------------------------------------------------------------------------------------------------
#
# OPTIONAL
#
# ----------------------------------------------------------------------------------------------------
variable "billing_mode" {
  description = <<-EOT
      Controls how you are charged for read and write throughput and how you manage capacity. 
      The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED.
    EOT
  type        = string
  default     = "PROVISIONED"
}

variable "deletion_protection_enabled" {
  description = "Enables deletion protection for table. Defaults to false."
  type        = bool
  default     = false
}

variable "read_capacity" {
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = null

  validation {
    condition     = var.billing_mode != "PROVISIONED" || var.read_capacity != null
    error_message = "The write_capacity must be set when billing_mode is PROVISIONED."
  }
}

variable "write_capacity" {
  description = "Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = null

  validation {
    condition     = var.billing_mode != "PROVISIONED" || var.write_capacity != null
    error_message = "The write_capacity must be set when billing_mode is PROVISIONED."
  }
}

variable "tags" {
  description = "Map of tags to assign to the queue."
  type        = map(any)
  default     = {}
}

variable "ttl" {
  description = "TTL (Time-To-Live) configuration for the DynamoDB table."
  type = object({
    enabled        = bool
    attribute_name = string
  })
  default = {}
}

variable "range_key" {
  description = "Attribute to use as the range (sort) key. Must also be defined as an attribute."
  type        = string
  default     = null
}
