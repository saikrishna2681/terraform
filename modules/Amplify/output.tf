output "amplify_app_id" {
  description = "The ID of the Amplify app"
  value       = aws_amplify_app.this.id
}

output "amplify_app_arn" {
  description = "The ARN of the Amplify app"
  value       = aws_amplify_app.this.arn
}

output "amplify_branch_arn" {
  description = "The ARN of the Amplify branch"
  value       = aws_amplify_branch.this.arn
}
