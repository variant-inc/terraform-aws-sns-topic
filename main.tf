module "sns_topic" {
  source                           = "terraform-aws-modules/sns/aws"
  version                          = "~> 3.0"
  create_sns_topic                 = true
  name                             = var.name
  display_name                     = var.display_name
  fifo_topic                       = var.fifo_topic
  content_based_deduplication      = var.content_based_deduplication
  delivery_policy                  = var.delivery_policy
  sqs_success_feedback_role_arn    = var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate = var.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn    = var.sqs_failure_feedback_role_arn
  kms_master_key_id                = var.kms_key_sns_arn
  tags                             = var.tags
}

data "aws_iam_policy_document" "sns_publish_policy" {
  policy_id = "SNSTopicsPublish"
  version   = "2012-10-17"
  statement {
    effect    = "Allow"
    resources = [module.sns_topic.sns_topic_arn]
    actions   = ["sns:ListSubscriptionsByTopic", "sns:Publish"]
  }
  statement {
    effect    = "Allow"
    resources = [var.kms_key_sns_arn]
    actions = [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ]
  }
}