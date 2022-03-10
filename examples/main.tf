data "aws_kms_key" "sns_alias" {
  key_id = "alias/ops/sns"
}
module "sns_topic" {
  source = "../"

  name                     = var.name
  display_name             = var.display_name
  aws_resource_name_prefix = var.aws_resource_name_prefix
  kms_key_sns_alias_arn    = data.aws_kms_key.sns_alias.arn
  tags                     = var.tags
}