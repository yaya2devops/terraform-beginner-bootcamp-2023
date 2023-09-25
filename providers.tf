terraform {

  #cloud {
  #  organization = "yayaintfcloud"

  #  workspaces {
  #    name = "terra-house-2023"
  #  }
  #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}
provider "random" {
}
