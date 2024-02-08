variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = "eu-central-1"
}
variable "name-project" {
  description = "Назва проекту, потрібно змінити"
  type        = string
  default     = "<name-project>"
  validation {
    condition = strcontains("<name-project>", var.name-project)
    error_message = "Вкажіть назву проекту"

  }
}
variable "environment" {
  description = "Середовище проекту"
  type        = string
}

variable "repository-name" {
  description = "Repository name"
  type        = string
  default     = "<name-repo>"
  validation {
    condition = strcontains("<name-repo>", var.repository-name)
    error_message = "Вкажіть назву репозиторію"

  }
}