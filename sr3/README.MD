# S3
- Simple Storage Service
- Database available on AWS
- Globally available
- DR (Disaster Recovery)
- Can store any files
- CRUD ACTIONS (Create, Bucket/Object, Read, Update, Delete)
From local host to EC2

E.g. when github goes down, S3 will still have the storage available as an option for disaster recovery.

![S3](DevOpsIsh.png)

AWSCLI<br>
AWS SEC & Access Keys<br>
Required to access S3 from EC2 storage for CRUD
actions from any AWS zone.

Standard - Data be accessed anytime<br>
Glacier - Infrequent access to data, but cheaper<br>
CDN - Content Delivery Network<br><br>

How to access S3:<br>
- Enter EC2 instance
- Python 3 or above
- Install pip3
- Ensure to use python 3
- `sudo apt install python3.7-minimal`
- alias python=python3.7
- sudo pip3 install awscli
- aws configure
- Enter access key, secret key, region (eu-west-1), and json for output data type
- aws s3 ls

To create a bucket after accessing S3:
- `aws s3 mb s3://name-of-bucket`
- The name of the bucket cannot contain underscores due to the naming convention

Copy files from the EC2 into the S3 storage:
- `aws s3 cp nameoffile.txt s3://name-of-bucket`

Download files from the S3 storage into the EC2:
- `aws s3 cp s3://name-of-bucket/name-of-file.txt nameoffile.txt`

Deleting local file test.txt:<br>
- `s3.Object(bucket_name, filename).delete()`

Recreating the bucket (only works if it doesn't exist already):<br>
- `s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)`

Deleting the entire bucket (only works if it's empty):
- `s3.Bucket(bucket_name).delete()`

Upload file to the bucket called test.txt:<br>
- `s3.Bucket(bucket_name).upload_file(filename, "hooyah")`

Download a file from the bucket called test.txt:<br>
- `s3.Bucket(bucket_name).download_file(filename, "wongotongo.txt")`
<br><br>

All in combination, I have created an interactive file that asks for input to use each action on:<br>


```python
#!/usr/bin/env python
import boto3
location = {'LocationConstraint': "eu-west-1"}
s3 = boto3.resource('s3')
bucket_name = input("what is the bucket name\n")

while True:
    action = input("what would you like you to do? c for createbucket, db for delete bucket, d for delete file, u for upload, dl for download, e for exit\n").lower()

    if action == "db":
        s3.Bucket(bucket_name).delete()
    elif action == "cb":
        s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)
    elif action == "d":
        filename = input("what is the filename?\n")
        s3.Object(bucket_name, filename).delete()
    elif action == "u":
        filename = input("what is the name of the file you're uploading?\n")
        targetfilename = input("what is the destination file name?\n")
        s3.Bucket(bucket_name).upload_file(filename, targetfilename)
    elif action == "dl":
        filename = input("what is the name of the file you're downloading?\n")
        targetfilename = input("what is the destination file name?\n")
        s3.Bucket(bucket_name).download_file(filename, targetfilename)
    elif action == "e":
        break
```