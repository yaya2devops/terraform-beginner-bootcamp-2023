
variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

#variable "bucket_name" {
# type = string
#}

variable "tnrap" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "tnfood" {
  type = object({
    public_path = string
    content_version = number
  })
}