variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = "eu-central-1"
}
variable "repository-name" {
  description = "Repository name"
  type        = string
  default     = "<name-repo>"
  validation {
    condition = strcontains("<name-repo>", var.repository-name)
  }
}