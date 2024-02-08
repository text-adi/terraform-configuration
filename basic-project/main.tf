module "integration-github-oidc" {
  source = "./integration-github-oidc-with-aws"
}

module "ecr-private" {
  source = "./ecr-private"
}

