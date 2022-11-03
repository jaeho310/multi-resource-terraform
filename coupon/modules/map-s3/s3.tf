resource "aws_s3_bucket" "map_bucket" {
  bucket = var.bucket_name
  tags = var.bucket_tags
  force_destroy = var.force_destroy
}