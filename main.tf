terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

    cloud {
    organization = "yayaintfcloud"

    workspaces {
      name = "terra-house-2023"
    }
  }
}
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
  
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "How to play League in 2023"
  description = <<DESCRIPTION
Yaya is making something so great and  so innovative.
Something Amazing is cooking with the greatest and only Yaya.
Feeling Empowered.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "dsr8d7veawg4z.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}