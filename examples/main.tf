data "aws_kms_key" "sns" {
  key_id = "alias/ops/sns"
}
module "sns_topic" {
  source = "../"

  name            = var.name
  display_name    = var.display_name
  kms_key_sns_arn = data.aws_kms_key.sns.arn
  tags            = var.tags
}