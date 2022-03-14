data "aws_kms_key" "sns" {
  key_id = "alias/ops/sns"
}
module "sns_topic" {
  source = "../"

  name            = "dpl-test-topic-naveen"
  display_name    = "This is test"
  kms_key_sns_arn = data.aws_kms_key.sns.arn
  tags = {
    "owner" : "naveen"
  }
}