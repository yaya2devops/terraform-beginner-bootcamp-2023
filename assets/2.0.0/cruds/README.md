```
$ ./delete 5151a588f5-18c2-461b-ba97-adfd520eb9a9
{
  "err": "failed to find home with provided uuid and bearer token"
}
gitpod /workspace/terraform-beginner-bootcamp-2023/bin/terratowns (49-terratown-sinatra-server) $ ./create 
{"uuid":"82966322-962d-4910-b9e9-a4013a765730"}


gitpod /workspace/terraform-beginner-bootcamp-2023/bin/terratowns (49-terratown-sinatra-server) $ ./read 82966322-962d-4910-b9e9-a4013a765730
{
  "uuid": "82966322-962d-4910-b9e9-a4013a765730",
  "name": "New House",
  "town": "cooker-cove",
  "description": "A new house description",
  "domain_name": "3xf332sdfs.cloudfront.net",
  "content_version": 1
}
gitpod /workspace/terraform-beginner-bootcamp-2023/bin/terratowns (49-terratown-sinatra-server) $ ./update 82966322-962d-4910-b9e9-a4013a765730
{"uuid":"82966322-962d-4910-b9e9-a4013a765730"}


gitpod /workspace/terraform-beginner-bootcamp-2023/bin/terratowns (49-terratown-sinatra-server) $ ./delete 82966322-962d-4910-b9e9-a4013a765730
{
  "uuid": "82966322-962d-4910-b9e9-a4013a765730"
}
```