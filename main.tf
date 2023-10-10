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


provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
 
## Duplicable Block Per Page
module "home_tnrap_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.tnrap.public_path
  content_version = var.tnrap.content_version
}

resource "terratowns_home" "home_tnrap_hostinghome" {
  name = "What Music You Really Should Know About?"
  description = <<DESCRIPTION
🎤🔥 Dive into the Rhythmic Beats of Tunisian Rap! 🇹🇳🎶 
Uncover the Authentic Soundtrack of Tunisia's Streets with Our Handpicked Selection of Tunisian Rap Favorites. 
From Hard-Hitting Bars to Soul-Stirring Rhymes, Experience the Raw Talent and Unique Stories of Tunisian Rappers. 
Ready to Groove to the Beat of North African Hip-Hop? 
Click Now to Discover Your Next Musical Obsession! 
🎵👑 #TunisianRapVibes #HipHopTunisia
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "dsr8d7veawg4z.cloudfront.net"
  domain_name = module.home_tnrap_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = 1
}

module "home_tnfood_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.tnfood.public_path
  content_version = var.tnfood.content_version
}

resource "terratowns_home" "home_tnfood" {
  name = "Have You ever Wondered about Tunisian Food? Whats Tunisia?"
  description = <<DESCRIPTION
Embark on a Flavorful Journey through Tunisia's Culinary Treasures! 🍽️ 
Explore the Rich and Diverse World of Tunisian Cuisine 
–From Sizzling Shawarma to Heavenly Harissa, We've Got It All! 
Get Ready to Satisfy Your Taste Buds and Discover the Authentic Flavors of Tunisia. 
Click Now for a Tantalizing Gastronomic Experience! 🇹🇳🔥 
#TasteTunisia #FoodieAdventures
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "dsr8d7veawg4z.cloudfront.net"
  domain_name = module.home_tnfood_hosting.domain_name
  town = "cooker-cove"
  content_version = 1
}


### TV Show TerraHome
module "home_favshow_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.favshow.public_path
  content_version = var.favshow.content_version
}

resource "terratowns_home" "home_favshow" {
  name = "The Best TV Show You'll Ever Watch"
  description = <<DESCRIPTION
💥Join us as we unravel the gripping tale of high-stakes crime, morality, and transformation that has captured the hearts of millions worldwide.💥
DESCRIPTION
  domain_name = module.home_favshow_hosting.domain_name
  town = "video-valley"
  content_version = 1
}


### Gaming TerraHome
module "home_lolplayz_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.lolplayz.public_path
  content_version = var.lolplayz.content_version
}

resource "terratowns_home" "home_lolplayz" {
  name = "What Yahya Used To play A lot?"
  description = <<DESCRIPTION
Uncover Yahya's past gaming obsession and how his extensive involvement with League of Legends eventually severed that connection, enabling him to devote more time to other pursuits.
DESCRIPTION
  domain_name = module.home_lolplayz_hosting.domain_name
  town = "gamers-grotto"
  content_version = 1
}

### Travel TerraHome
module "home_travlz_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.travlz.public_path
  content_version = var.travlz.content_version
}

resource "terratowns_home" "home_travlz" {
  name = "Could Tunisia Be Your Next Country To Explore?"
  description = <<DESCRIPTION
Tunisia offers incredible affordability for a fantastic vacation. 
Don't hesitate any longer—explore this specially curated collection of destinations I've prepared just for you!
DESCRIPTION
  domain_name = module.home_travlz_hosting.domain_name
  town = "the-nomad-pad"
  content_version = 1
}