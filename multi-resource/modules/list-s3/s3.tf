resource "aws_s3_bucket" "list_bucket" {
  count = length(var.list_bucket)
  bucket = var.list_bucket[count.index].name
  tags = var.list_bucket[count.index].tags
  force_destroy = var.list_bucket[count.index].force_destroy
}