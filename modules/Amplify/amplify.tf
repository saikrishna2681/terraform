resource "aws_amplify_app" "this" {
  name         = var.app_name
  repository   = var.repository
  oauth_token  = var.oauth_token
  #branch       = var.branch

  environment_variables = var.environment_variables

  build_spec = var.build_spec

  dynamic "custom_rules" {
    for_each = var.custom_rules
    content {
      source = custom_rules.value.source
      target = custom_rules.value.target
      status = custom_rules.value.status
    }
  }
}

resource "aws_amplify_backend_environment" "this" {
  count          = var.branch == "" ? 0 : 1
  app_id         = aws_amplify_app.this.id
  environment_name = "dev"
}

resource "aws_amplify_branch" "this" {
  count          = var.branch == "" ? 0 : 1
  app_id         = aws_amplify_app.this.id
  branch_name    = var.branch
  environment_variables = var.environment_variables
}
