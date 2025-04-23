variable "delay_seconds" {
  description = "Time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds."
  type        = number
  default     = null
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  type        = bool
  default     = false
}


variable "kms_master_key_id" {
  description = "ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  default     = null
}

variable "name" {
  description = <<-EOT
    Name of the queue. Queue names must be made up of only uppercase and lowercase ASCII letters,
    numbers, underscores, and hyphens, and must be between 1 and 80 characters long. For a FIFO 
    (first-in-first-out) queue, the name must end with the .fifo suffix. If omitted, Terraform will 
    assign a random, unique name. Conflicts with name_prefix.
    EOT
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "max_message_size" {
  description = <<-EOT
      Limit of how many bytes a message can contain before Amazon SQS rejects it. 
      An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). 
      The default for this attribute is 262144 (256 KiB).
    EOT
  type        = number
  default     = null
}

variable "message_retention_seconds" {
  description = <<-EOT
      Number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) 
      to 1209600 (14 days). The default for this attribute is 345600 (4 days).
    EOT
  type        = number
  default     = null
}

variable "receive_wait_time_seconds" {
  description = <<-EOT
      Time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. 
      An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately.
    EOT
  type        = number
  default     = null
}

variable "sqs_managed_sse_enabled" {
  description = "Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the queue."
  type        = map(any)
  default     = {}
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30."
  type        = number
  default     = null
}
