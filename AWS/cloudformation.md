#### Install extensions in vs code <br>
1)yaml by redhat <br>
2)AWS tool kit <br>

======================


## 1)S3 bucket
```
AWSTemplateFormatVersion: 2010-09-09
Description: CloudFormation template for s3 bucket 
  
Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Description: Creating Amazon S3 bucket from CloudFormation
    Properties:
      BucketName: mr-37463763
      VersioningConfiguration:
        Status: Enabled
        
Outputs:
  S3Bucket:
    Description: Bucket Created using this template.
    Value: !Ref S3Bucket
```
<br>

## 2)s3-bucket with parametes
```
AWSTemplateFormatVersion: 2010-09-09
Description: CloudFormation template for s3 bucket 

Parameters:
 name: 
  Description : provide name for your s3 bucket
  Type: String

Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Description: Creating Amazon S3 bucket from CloudFormation
    Properties:
      BucketName: !Ref name
      VersioningConfiguration:
        Status: Suspended   
        
Outputs:
  S3Bucket:
    Description: Bucket Created using this template.
    Value: !Ref S3Bucket
```

## 3)EC2-instance

```

Resources:  
  MyEC2Instance: 
    Type: AWS::EC2::Instance
    Properties: 
      ImageId: "ami-06f621d90fa29f6d0"
      InstanceType: t2.micro
Outputs:
  ec2instace:
    Description: Ec2-Instance Created using this template.
    Value: !Ref MyEC2Instance
```
<br>

## 4) EC2+S3 combined
```

AWSTemplateFormatVersion: 2010-09-09
Description: CloudFormation template for s3 bucket 

Parameters:
 name: 
  Description : provide name for your s3 bucket
  Type: String

Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Description: Creating Amazon S3 bucket from CloudFormation
    Properties:
      BucketName: !Ref name
      VersioningConfiguration:
        Status: Suspended 
  Myfirstec2instacefromcloudformation:
    Type: AWS::EC2::Instance
    Properties: 
      ImageId: "ami-06f621d90fa29f6d0"
      InstanceType: t2.micro

        
Outputs:
  S3Bucket:
    Description: Bucket Created using this template.
    Value: !Ref S3Bucket
  Ec2instacce:
    Description: Ec2-Instance Created using this template.
    Value: !Ref Myfirstec2instacefromcloudformation  
```
     
