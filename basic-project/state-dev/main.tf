# Create local variable
locals {
  aws-region   = var.aws-region
  name-project = var.name-project
  environment  = var.environment
}

module "integration-github-oidc" {
  source       = "../modules/integration-github-oidc-with-aws"
  name-project = local.name-project
  environment  = local.environment
  aws-region   = local.aws-region
}

module "ecr-private" {
  source          = "../modules/ecr-private"
  repository-name = var.name-project
  environment     = local.environment
  aws-region      = local.aws-region
}

