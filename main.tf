terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  }

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid = "61b3ff04-82db-4816-a894-e260a6a2383f"
  token = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}
  
#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  content_version = var.content_version
#}

resource "terratowns_home" "home" {
  name = "How to play League in 2023"
  description = <<DESCRIPTION
Yaya is making something so great and  so innovative.
Something Amazing is cooking with the greatest and only Yaya.
Feeling Empowered.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "veryveryrandomm.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}