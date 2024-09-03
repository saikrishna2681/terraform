

terraform {
  backend "s3" {
    bucket         = "terraform-state-file-dev-miq"
    key            = "terraform/state/terraform.tfstate"
    region          = "ap-south-1"
    dynamodb_table  = "terraform-state-lock-dev-miq"
    encrypt         = true
  }
}

