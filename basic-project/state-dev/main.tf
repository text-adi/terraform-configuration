# Create local variable
locals {
  aws-region   = var.aws-region
  name-project = var.name-project
  environment  = var.environment
  github-repo  = var.github-repo
}


module "ecr-private" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  repository_name = var.name-project

  # Lifecycle policy
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Delete old images",
        selection    = {
          tagStatus      = "tagged",
          tagPatternList = ["*"],
          countType      = "imageCountMoreThan",
          countNumber    = var.count-save-docker-image
        },
        action = {
          type = "expire"
        }
      },

    ]
  })

  # Scanning configuration
  manage_registry_scanning_configuration = true
  repository_image_scan_on_push = false
  registry_scan_type                     = "BASIC"
  registry_scan_rules                    = [
    {
      scan_frequency = "SCAN_ON_PUSH"
      filter         = "*"
      filter_type    = "WILDCARD"
    }
  ]
  tags = {
    Name = var.name-project
  }
}

module "iam_iam-github-oidc-role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.34.0"

  name     = "github-actions-role-${local.name-project}-${local.environment}"
  subjects = local.github-repo
  policies = {
    ECRPushImage = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicPowerUser"
  }
  tags = {
    Name        = local.name-project
    Environment = local.environment
  }
}

