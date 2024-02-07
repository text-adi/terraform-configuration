variable "aws-region" {
  description = "AWS Region для якого будуть здійснені налаштування"
  type        = string
  default     = "eu-central-1"
}
# налаштування проекту
variable "name-project" {
  description = "Назва проекту, потрібно змінити"
  type        = string
  default     = "<name-project>"
  validation {
    condition = strcontains("<name-project>", var.name-project)
  }
}

variable "github-repo" {
  description = "Для якого репозиторію, здійснюються налаштування. Рекомендується, використовувати єдиний репо, але вказувати гілки з якими працюємо"
  type        = list(string)
  default     = [
    "repo:<owner>/<repo-name>:<branch>",
  ]
  validation {
    condition = strcontains("repo:<owner>/<repo-name>:<branch>", var.github-repo)
  }
}
