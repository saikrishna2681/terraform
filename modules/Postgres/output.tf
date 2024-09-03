output "db_instance_endpoint" {
  description = "The endpoint of the PostgreSQL instance."
  value       = aws_db_instance.this.endpoint
}

output "db_instance_arn" {
  description = "The ARN of the PostgreSQL instance."
  value       = aws_db_instance.this.arn
}

output "security_group_postgres" {
  value = aws_security_group.postgres.id
}