variable "list_bucket" {
  type = list(
    object({
      name = string
      tags = object({})
      force_destroy = bool
    })
  )
}