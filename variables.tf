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

variable "lambda" {
  description = "Map of any additional arguments for the upstream lambda module. See <https://github.com/terraform-aws-modules/terraform-aws-lambda>"
  type        = any
  default     = {}
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
