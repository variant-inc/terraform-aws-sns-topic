variable "aws_resource_name_prefix" {
  type        = string
  description = "Prefix of team name to be applied to created resources."
}

variable "name" {
  type        = string
  description = "The name of the SNS topic to create"
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}