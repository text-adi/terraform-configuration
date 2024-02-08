data "aws_caller_identity" "this" {}
module "aws-s3" {
  source = "git::https://github.com/text-adi/terraform-modules.git//modules/aws/s3"
  name   = "terraform-s3-state-${data.aws_caller_identity.this.account_id}"
}