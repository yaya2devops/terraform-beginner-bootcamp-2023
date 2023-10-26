```sh
(29-design-tf-root-module) $ terraform plan -var user_uuid="f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d" 
Running plan in Terraform Cloud. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/yayaintfcloud/terra-house-2023/runs/run-4EXXusgMb9mZeD4d

Waiting for the plan to start...

Terraform v1.5.7
on linux_amd64
Initializing plugins and modules...
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "AWS_DEFAULT_REGION" but
│ a value was found in file
│ "/home/tfc-agent/.tfc-agent/component/terraform/runs/run-4EXXusgMb9mZeD4d/terraform.tfvars".
│ If you meant to use this value, add a "variable" block to the
│ configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide
│ certain "global" settings to all configurations in your organization. To
│ reduce the verbosity of these warnings, use the -compact-warnings option.
╵

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.example will be created
  + resource "aws_s3_bucket" "example" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
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

  # random_string.bucket_name will be created
  + resource "random_string" "bucket_name" {
      + id          = (known after apply)
      + length      = 32
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + numeric     = true
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + random_bucket_name = (known after apply)
```


- After adding this var to our `terraform.tfvars`
```
user_uuid="f6d4a521-8a07-4b3f-9d73-2e817a8dcb3d"
```

- run `terraform plan` only. Same results.
```
gitpod /workspace/terraform-beginner-bootcamp-2023 (29-design-tf-root-module) $ terraform plan
Running plan in Terraform Cloud. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/yayaintfcloud/terra-house-2023/runs/run-ouC6kPhvxXeTECuT

Waiting for the plan to start...

Terraform v1.5.7
on linux_amd64
Initializing plugins and modules...
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "AWS_DEFAULT_REGION" but
│ a value was found in file
│ "/home/tfc-agent/.tfc-agent/component/terraform/runs/run-ouC6kPhvxXeTECuT/terraform.tfvars".
│ If you meant to use this value, add a "variable" block to the
│ configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide
│ certain "global" settings to all configurations in your organization. To
│ reduce the verbosity of these warnings, use the -compact-warnings option.
╵

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.example will be created
  + resource "aws_s3_bucket" "example" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
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

  # random_string.bucket_name will be created
  + resource "random_string" "bucket_name" {
      + id          = (known after apply)
      + length      = 32
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + numeric     = true
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + random_bucket_name = (known after apply)
```