```hcl
resource "random_id" "bucket" {
  byte_length = 8
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name_prefix}-${var.environment}-s3-${random_id.bucket.hex}"
  tags = {
    Environment = var.environment
    Project     = "schoolspider"
    ManagedBy   = "terraform"
  }
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.bucket
  versioning_enabled = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = data.aws_kms_key.default.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```