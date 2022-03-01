output "sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = module.sns_topic.sns_topic_arn
}

output "sns_topic_name" {
  description = "NAME of SNS topic"
  value       = module.sns_topic.sns_topic_name
}

output "sns_topic_id" {
  description = "ID of SNS topic"
  value       = module.sns_topic.sns_topic_id
}

output "sns_topic_owner" {
  description = "OWNER of SNS topic"
  value       = module.sns_topic.sns_topic_owner
}