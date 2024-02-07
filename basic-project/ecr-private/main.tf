module "aws-ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  repository_name = var.repository-name

  # Lifecycle policy
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Delete old images",
        selection    = {
          tagStatus      = "tagged",
          tagPatternList = ["*-prod"],
          countType      = "imageCountMoreThan",
          countNumber    = 3
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2,
        description  = "Delete old images",
        selection    = {
          tagStatus      = "tagged",
          tagPatternList = ["*-dev"],
          countType      = "imageCountMoreThan",
          countNumber    = 2
        },
        action = {
          type = "expire"
        }
      },

    ]
  })

  # Scanning configuration
  manage_registry_scanning_configuration = true
  registry_scan_type                     = "BASIC"
  registry_scan_rules                    = [
    {
      scan_frequency = "SCAN_ON_PUSH"
      filter         = "*"
      filter_type    = "WILDCARD"
    }
  ]
}