# Configuration options
terraform {
  backend "s3" {
    bucket = ""
  }
}

provider "aws" {
  region = var.aws-region
}

