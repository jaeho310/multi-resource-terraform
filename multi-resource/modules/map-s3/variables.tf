variable "bucket_name" {
  type = string
}

variable "bucket_tags" {
  type = object({})
}

variable "force_destroy" {
  type = bool
}