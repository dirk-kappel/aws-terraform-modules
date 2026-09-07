variable "aws_account" {
  description = "AWS accounts that will be created."
  type = map(object({
    name            = string
    email           = string
    create_govcloud = optional(bool, false)
  }))
  default = {
    OLDCC-Production = {
      email = "dirk.michael.kappel+oldcc-production@gmail.com"
    }
    OLDCC-Development = {
      email = "dirk.michael.kappel+oldcc-development@gmail.com"
    }
  }
}

variable "close_on_deletion" {
  description = "If true, a deletion event will close the account. Otherwise, it will only remove from the organization."
  type        = bool
  default     = true
}