### Bucketポリシー

```
### すべて許可
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "allow",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::your-bucket-name",
                "arn:aws:s3:::your-bucket-name/*"
            ]
        }
    ]
}
```

### IAMポリシー

```
### 明示的Denyのほうが優先
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "NotPrincipal": {
                "AWS": "arn:aws:iam::123456789012:role/Role_A"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::your-bucket-name",
                "arn:aws:s3:::your-bucket-name/*"
            ]
        }
    ]
}

### roleに許可するアクション以外をDeny 
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": {
                "AWS": "arn:aws:iam::123456789012:role/Role_A"
            },
            "Action": "s3:PutObject",
            "Resource": [
                "arn:aws:s3:::your-bucket-name",
                "arn:aws:s3:::your-bucket-name/*"
            ]
        }
    ]
}
```
