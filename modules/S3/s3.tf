resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.environment}-${var.name}"
}


resource "aws_s3_bucket_versioning" "my_s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_s3-bucket_encryption" {
  bucket = aws_s3_bucket.s3-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "my_s3_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.s3-bucket.id
  rule {
    id     = "dev_lifecycle_miq_7_days"
    status = "Enabled"

    transition {
      storage_class = var.storage_class
      days = var.days
    }
  }
}

