locals {
  // 잘못된 방식
  list_bucket = [
    {
      name = "${var.workspace.phase}-blue-bucket-test"
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = true
    },
    {
      name = "${var.workspace.phase}-red-bucket-test"
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = true
    },
    {
      name = "${var.workspace.phase}-black-bucket-test"
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = false
    },
  ]
  // 올바른 방식
  map_bucket = {
    "${var.workspace.phase}-brown-bucket-test"= {
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = false
    },
    "${var.workspace.phase}-pink-bucket-test"= {
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = false
    },
    "${var.workspace.phase}-yellow-bucket-test"= {
      tags = {
        service = "${var.workspace.phase}-coupon"
        terraform = "true"
      }
      force_destroy = false
    }
  }
}

module "s3_list_bucket" {
  source = "../modules/list-s3"
  list_bucket = local.list_bucket
}

module "s3_map_bucket" {
  source = "../modules/map-s3"
  for_each = local.map_bucket
  bucket_name = each.key
  bucket_tags = each.value.tags
  force_destroy = each.value.force_destroy
}