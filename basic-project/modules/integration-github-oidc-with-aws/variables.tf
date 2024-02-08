variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = ""
}
# налаштування проекту
variable "name-project" {
  description = "Назва проекту, потрібно змінити"
  type        = string
  default     = ""
  validation {
    condition = var.name-project == ""
    error_message = "Вкажіть назву проекту"

  }
}
variable "environment" {
  description = "Середовище проекту"
  type        = string
}

variable "github-repo" {
  description = "Для якого репозиторію, здійснюються налаштування. Рекомендується, використовувати єдиний репо, але вказувати гілки з якими працюємо"
  type        = list(string)
  default     = []
}
