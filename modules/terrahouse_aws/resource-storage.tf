resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath
  content_type = "text/html"

  etag = filemd5(var.index_html_filepath)
  lifecycle {
    ignore_changes = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "upload_assets" {
  for_each = fileset(var.assets_path,"*.{jpg,png,gif}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "assets/${each.key}"
  source = "${var.assets_path}/${each.key}"
  etag = filemd5("${var.assets_path}/${each.key}")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath
  content_type = "text/html"

  #etag = filemd5(var.error_html_filepath)
  #lifecycle {
  #  ignore_changes = [etag]
  #}
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.bucket
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = {
      "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
      "Effect" = "Allow",
      "Principal" = {
        "Service" = "cloudfront.amazonaws.com"
      },
      "Action" = "s3:GetObject",
      "Resource" = "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
      "Condition" = {
      "StringEquals" = {
          #"AWS:SourceArn": data.aws_caller_identity.current.arn
          "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
        }
      }
    }
  })
}

resource "terraform_data" "content_version" {
  input = var.content_version
}

resource "terraform_data" "invalidate_cache" {
  triggers_replace = terraform_data.content_version.output

  provisioner "local-exec" {
    # https://developer.hashicorp.com/terraform/language/expressions/strings#heredoc-strings
    command = <<COMMAND
aws cloudfront create-invalidation \
--distribution-id ${aws_cloudfront_distribution.s3_distribution.id} \
--paths '/*'
    COMMAND

  }
}