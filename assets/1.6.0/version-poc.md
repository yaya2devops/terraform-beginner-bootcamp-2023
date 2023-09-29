# `1.6.0`

```sh
(39-tf-content-version) $ terraform apply
module.terrahouse_aws.terraform_data.content_version: Refreshing state... [id=9c0acc20-0e05-9997-df2b-af633ad04e6b]
module.terrahouse_aws.data.aws_caller_identity.current: Reading...
module.terrahouse_aws.aws_cloudfront_origin_access_control.default: Refreshing state... [id=E23IAYBQD595KW]
module.terrahouse_aws.data.aws_caller_identity.current: Read complete after 0s [id=<aws-id>]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution will be created
  + resource "aws_cloudfront_distribution" "s3_distribution" {
      + arn                            = (known after apply)
      + caller_reference               = (known after apply)
      + comment                        = "Static website hosting for: aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + default_root_object            = "index.html"
      + domain_name                    = (known after apply)
      + enabled                        = true
      + etag                           = (known after apply)
      + hosted_zone_id                 = (known after apply)
      + http_version                   = "http2"
      + id                             = (known after apply)
      + in_progress_validation_batches = (known after apply)
      + is_ipv6_enabled                = true
      + last_modified_time             = (known after apply)
      + price_class                    = "PriceClass_200"
      + retain_on_delete               = false
      + staging                        = false
      + status                         = (known after apply)
      + tags                           = {
          + "UserUuid" = "f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d"
        }
      + tags_all                       = {
          + "UserUuid" = "f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d"
        }
      + trusted_key_groups             = (known after apply)
      + trusted_signers                = (known after apply)
      + wait_for_deployment            = true

      + default_cache_behavior {
          + allowed_methods        = [
              + "DELETE",
              + "GET",
              + "HEAD",
              + "OPTIONS",
              + "PATCH",
              + "POST",
              + "PUT",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = false
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + target_origin_id       = "MyS3Origin"
          + trusted_key_groups     = (known after apply)
          + trusted_signers        = (known after apply)
          + viewer_protocol_policy = "allow-all"

          + forwarded_values {
              + headers                 = (known after apply)
              + query_string            = false
              + query_string_cache_keys = (known after apply)

              + cookies {
                  + forward           = "none"
                  + whitelisted_names = (known after apply)
                }
            }
        }

      + origin {
          + connection_attempts      = 3
          + connection_timeout       = 10
          + domain_name              = (known after apply)
          + origin_access_control_id = "E23IAYBQD595KW"
          + origin_id                = "MyS3Origin"
        }

      + restrictions {
          + geo_restriction {
              + locations        = (known after apply)
              + restriction_type = "none"
            }
        }

      + viewer_certificate {
          + cloudfront_default_certificate = true
          + minimum_protocol_version       = "TLSv1"
        }
    }

  # module.terrahouse_aws.aws_s3_bucket.website_bucket will be created
  + resource "aws_s3_bucket" "website_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "UserUuid" = "f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d"
        }
      + tags_all                    = {
          + "UserUuid" = "f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # module.terrahouse_aws.aws_s3_bucket_policy.bucket_policy will be created
  + resource "aws_s3_bucket_policy" "bucket_policy" {
      + bucket = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + id     = (known after apply)
      + policy = (known after apply)
    }

  # module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration will be created
  + resource "aws_s3_bucket_website_configuration" "website_configuration" {
      + bucket           = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + id               = (known after apply)
      + routing_rules    = (known after apply)
      + website_domain   = (known after apply)
      + website_endpoint = (known after apply)

      + error_document {
          + key = "error.html"
        }

      + index_document {
          + suffix = "index.html"
        }
    }

  # module.terrahouse_aws.aws_s3_object.error_html will be created
  + resource "aws_s3_object" "error_html" {
      + acl                    = (known after apply)
      + bucket                 = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + bucket_key_enabled     = (known after apply)
      + content_type           = "text/html"
      + etag                   = "50f3e1933710f2d6c3123df0b4214225"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "error.html"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + source                 = "/workspace/terraform-beginner-bootcamp-2023/public/error.html"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # module.terrahouse_aws.aws_s3_object.index_html will be created
  + resource "aws_s3_object" "index_html" {
      + acl                    = (known after apply)
      + bucket                 = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
      + bucket_key_enabled     = (known after apply)
      + content_type           = "text/html"
      + etag                   = "c4472aa82b612b827e5fa0c745b3ad4a"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "index.html"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + source                 = "/workspace/terraform-beginner-bootcamp-2023/public/index.html"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

  # module.terrahouse_aws.terraform_data.content_version will be updated in-place
  ~ resource "terraform_data" "content_version" {
        id     = "9c0acc20-0e05-9997-df2b-af633ad04e6b"
      ~ input  = 2 -> 3
      ~ output = 2 -> (known after apply)
    }

Plan: 6 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + s3_website_endpoint = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.terrahouse_aws.terraform_data.content_version: Modifying... [id=9c0acc20-0e05-9997-df2b-af633ad04e6b]
module.terrahouse_aws.terraform_data.content_version: Modifications complete after 0s [id=9c0acc20-0e05-9997-df2b-af633ad04e6b]
module.terrahouse_aws.aws_s3_bucket.website_bucket: Creating...
module.terrahouse_aws.aws_s3_bucket.website_bucket: Creation complete after 3s [id=aaa2w7yvypfkim1mhlp5bjbwqky9dadc]
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Creating...
module.terrahouse_aws.aws_s3_object.index_html: Creating...
module.terrahouse_aws.aws_s3_object.error_html: Creating...
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Creating...
module.terrahouse_aws.aws_s3_object.index_html: Creation complete after 0s [id=index.html]
module.terrahouse_aws.aws_s3_object.error_html: Creation complete after 0s [id=error.html]
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Creation complete after 1s [id=aaa2w7yvypfkim1mhlp5bjbwqky9dadc]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [10s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [20s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [30s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [40s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [50s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m0s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m10s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m20s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m30s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m40s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [1m50s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m0s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m10s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m20s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m30s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m40s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [2m50s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [3m0s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [3m10s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [3m20s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [3m30s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Still creating... [3m40s elapsed]
module.terrahouse_aws.aws_cloudfront_distribution.s3_distribution: Creation complete after 3m43s [id=E2EW2A1VBGV6H9]
module.terrahouse_aws.aws_s3_bucket_policy.bucket_policy: Creating...
module.terrahouse_aws.aws_s3_bucket_policy.bucket_policy: Creation complete after 1s [id=aaa2w7yvypfkim1mhlp5bjbwqky9dadc]

Apply complete! Resources: 6 added, 1 changed, 0 destroyed.

Outputs:

bucket_name = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc"
s3_website_endpoint = "aaa2w7yvypfkim1mhlp5bjbwqky9dadc.s3-website.ca-central-1.amazonaws.com"
```