variable "app_name" {
  description = "The name of the Amplify app"
  type        = string
}

variable "repository" {
  description = "The URL of the repository to connect to the Amplify app"
  type        = string
}

variable "branch" {
  description = "The repository branch to deploy"
  type        = string
  default     = "main"
}

variable "environment_variables" {
  description = "Environment variables for the Amplify app"
  type        = map(string)
  default     = {}
}

variable "custom_rules" {
  description = "Custom rules for the Amplify app"
  type        = list(object({
    source = string
    target = string
    status = number
  }))
  default = []
}

variable "build_spec" {
  description = "The build specification for the Amplify app"
  type        = string
  default     = ""
}

variable "oauth_token" {
  description = "OAuth token for connecting to the repository"
  type        = string
  default     = null
}
