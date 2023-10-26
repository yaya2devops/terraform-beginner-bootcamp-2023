## Usefull Commands
- Created an issue
- Create a branch 
```
git checkout -b <name-branch>
```
- Update Branch  with semver💡 and push
- Create tag of the branch 
```
git tag 0.1.0
```
- Push the tag
```
git push --tags
```

### Associate Branches To Issues

name the commit starting with the issue number e.g.;

```
#1 add lamp to Semantic Versioning
```


### CloudFront SDK

We can do it using this as well..
```
aws cloudfront create-distribution --distribution-config file://my-cloudfront-config.json

```

Sample config;
```json
{
    "CallerReference": "unique-identifier",
    "Aliases": {
        "Quantity": 0
    },
    "DefaultRootObject": "index.html",
    "Origins": {
        "Quantity": 1,
        "Items": [
            {
                "Id": "S3-Origin",
                "DomainName": "your-s3-bucket.s3.amazonaws.com",
                "S3OriginConfig": {
                    "OriginAccessIdentity": ""
                }
            }
        ]
    },
    "DefaultCacheBehavior": {
        "TargetOriginId": "S3-Origin",
        "ForwardedValues": {
            "QueryString": false,
            "Cookies": {
                "Forward": "none"
            }
        },
        "TrustedSigners": {
            "Enabled": false,
            "Quantity": 0
        },
        "ViewerProtocolPolicy": "allow-all",
        "MinTTL": 0,
        "DefaultTTL": 86400,
        "MaxTTL": 31536000
    },
    "Comment": "My CloudFront Distribution"
}
```