data "aws_kms_key" "default" {
  key_id = "alias/aws/s3"  # Use the default AWS managed CMK for S3
}
