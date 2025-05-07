output "ecr_repository_url" {
  description = "The URL of the repository"
  value       = aws_ecr_repository.ecr-repository.repository_url
}

output "ecr_repository_arn" {
  description = "The ARN of the repository"
  value       = aws_ecr_repository.ecr-repository.arn
}

output "ecr_repository_name" {
  description = "The name of the repository"
  value       = aws_ecr_repository.ecr-repository.name
}

output "ecr_repository_registry_id" {
  description = "The registry ID where the repository was created"
  value       = aws_ecr_repository.ecr-repository.registry_id
}

output "replication_configuration_registry_id" {
  description = "The registry ID of the replication configuration"
  value       = var.enable_replication ? aws_ecr_replication_configuration.replication[0].registry_id : null
}

output "pull_through_cache_rule_id" {
  description = "The ID of the pull through cache rule"
  value       = var.create_pull_through_cache ? "${aws_ecr_pull_through_cache_rule.pull_through[0].ecr_repository_prefix}/${aws_ecr_pull_through_cache_rule.pull_through[0].upstream_registry_url}" : null
}