variable "assume_role_name" {
  description = "Name of the IAM role to assume in the target account (case sensitive)"
  type        = string
}

variable "update_role_name" {
  description = "Name of the IAM role to update in the target account (case sensitive)"
  type        = string
}

variable "trust_policy" {
  description = "JSON string representing the trust policy to apply to the role being updated"
  type        = string
}

variable "event_types" {
  description = "Event types that will trigger this lambda"
  type        = set(string)
  default = [
    "CreateAccountResult",
    "InviteAccountToOrganization",
  ]

  validation {
    condition     = alltrue([for event in var.event_types : contains(["CreateAccountResult", "InviteAccountToOrganization"], event)])
    error_message = "Supported event_types include only: CreateAccountResult, InviteAccountToOrganization"
  }
}

variable "lambda" {
  description = "Map of any additional arguments for the upstream lambda module. See <https://github.com/terraform-aws-modules/terraform-aws-lambda>"
  type = object({
  type = object({
    artifacts_dir            = optional(string, "builds")
    create_package           = optional(bool, true)
    ephemeral_storage_size   = optional(number)
    ignore_source_code_hash  = optional(bool, true)
    local_existing_package   = optional(string)
    recreate_missing_package = optional(bool, false)
    s3_bucket                = optional(string)
    s3_existing_package      = optional(map(string))
    s3_prefix                = optional(string)
    store_on_s3              = optional(bool, false)
  })
  })
  default = {}
}

variable "log_level" {
  default     = "info"
  description = "Log level of the lambda output, one of: debug, info, warning, error, critical"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags that are passed to resources"
  type        = map(string)
}
