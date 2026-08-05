```hcl
variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "schoolspider"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
```