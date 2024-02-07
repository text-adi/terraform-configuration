module "iam_github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.34.0"

}

module "iam_iam-github-oidc-role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.34.0"

  provider_url = module.iam_github_oidc_provider.url

  name     = "github-actions-role-${var.name-project}"
  subjects = var.github-repo
  policies = {
    ECRPushImage = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicPowerUser"
  }
}