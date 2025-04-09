resource "aws_s3_bucket" "web_assets" {
  bucket = "${var.s3_bucket_name}-${random_string.suffix.result}"

  tags = local.tags
}

resource "aws_s3_bucket_ownership_controls" "web_assets" {
  bucket = aws_s3_bucket.web_assets.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "web_assets" {
  bucket = aws_s3_bucket.web_assets.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "web_assets" {
  depends_on = [
    aws_s3_bucket_ownership_controls.web_assets,
    aws_s3_bucket_public_access_block.web_assets,
  ]

  bucket = aws_s3_bucket.web_assets.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "web_assets" {
  bucket = aws_s3_bucket.web_assets.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}
