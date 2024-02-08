variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = "eu-central-1"
}

variable "name-project" {
  type = string
}

variable "environment" {
  type = string
}

variable "github-repo" {
  type = list(string)
}

variable "count-save-docker-image" {
  type = number
}