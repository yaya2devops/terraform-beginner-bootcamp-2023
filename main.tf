

terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  }

provider "terratowns" {
  endpoint = "http://localhost:4567"
  user_uuid = "a573e3c3-64b5-4b3d-9c56-9b6f7c04a8af"
  token = "c41e9be1-1b5a-4a5e-b2d1-ec5d7c1e7c16"
}
  
#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  content_version = var.content_version
#}

resource "terratown_home" "home" {
  name = "How to play League in 2023"
  description = <<DESCRIPTION
Something so great and innovative.
Something Amazing.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "veryveryrandomm.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}