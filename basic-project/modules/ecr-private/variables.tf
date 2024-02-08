variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = "eu-central-1"
}
variable "name-project" {
  description = "Назва проекту, потрібно змінити"
  type        = string
  default     = ""
  validation {
    condition = var.name-project != ""
    error_message = "Вкажіть назву проекту"

  }
}
variable "environment" {
  description = "Середовище проекту"
  type        = string
}
