## Task Ticket - Configuration Drift Resolution 

https://github.com/omenking/terraform-beginner-bootcamp-2023/commit/6d8813285b45256d4db785942efb783c68f7e3d4
https://github.com/omenking/terraform-beginner-bootcamp-2023/issues/23

We need to address a configuration drift issue and ensure that the system's state is brought back to its intended configuration. 


Here are the specific steps to be taken:

- [ ] Utilize the `tf` import for the `random` module.
- [ ] Implement the `tf` import for the `bucket` module.
- [ ] Deliberately induce a configuration drift (terminate the state).
- [ ] Rectify the configuration drift.
- [ ] Restore the system to its intended state.

This will be followed meticulously to resolve the configuration drift issue in the upcoming PR.


commit can be: bucket should not use random proovider


---


How to fix it when you delete your state file and if there is anyway u cann recover it...


If u delete it u may not recover all.. depends how many resources it may be possible  but plzzz
make sure to store ur statae in thing like state file.. because we cant import on all resources..


https://developer.hashicorp.com/terraform/cli/import


that bucket is no longer managed by terraform...

how to get that state?


--we try import

go to tf registry=> providers=>aws=>search: s3 go to aws_s3_bucket 

look to the right there is "ON THIS PAGE" click import to go directly. it gave this:

import {
  to = aws_s3_bucket.bucket
  id = "bucket-name"
} 

and this;
% terraform import aws_s3_bucket.bucket bucket-name

take the command to cli and see.

% terraform import aws_s3_bucket.bucket <therandomoneinaws>

we called our bucket example.


% terraform import aws_s3_bucket.example <therandomoneinaws>

it will import new state but consider;
- it will not include the random config
- when u plan it will prompt to delete the bucket and create a new one and a random 2+ 1-


### Import random

maybe that would resolve our sissue


go to random provider, expand resources and click random_string, look to the right and click import.

terraform import random_string.test test


we named it bucket_name so it goes like;
terraform import random_string.bucket_name <paste-random-name-from-s3>

- now both are back to state.

but when we plan it seems to think that it needs to be replaced.


https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import
https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string#import


-- time to stop random bybye.


delete it from provider, delete its resource from maintf

and for bucket namem

change bucket =random_string.bucket_name.result 

to; 

bucket = var.bucket_name


go tfvars and add

bucket_name=<grap-from-s3>


define that variabele in var.tf

ask gpt to write tf var for bucket name and to validate the string so it is a valid bucket name for aws.


- in resources change the name of th ebucket from example to website_bucket.

- change the output
value = aws_s3_bucket.website_bucket.bucket


plan

apply


(make sure u deleted the old s3)


- worth ur time to write regex. (like validate stuff in variables block)

 
---
Learned about tf drift. (if u delete stuff, the state will tell u and recover it)
fix missing res with tf import 
fix manual config
---

- [x] Successfully used the `tf` import for the `random` module.
- [x] Implemented the `tf` import for the `bucket` module.
- [ ] Next step: Deliberately induce a configuration drift.
- [ ] Final step: Rectify the configuration drift and restore the system to its intended state.
