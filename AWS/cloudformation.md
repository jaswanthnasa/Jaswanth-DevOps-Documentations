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

## 5) SG with inbound and outbound
```
Resources:

  TestSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for to test drift
      GroupName: Test_SG_15
      VpcId: vpc-28382772d13508ae67
      Tags:
        - Key: AppName
          Value: Test_SG_15
  
  TestSecurityGroupOpenEgress:
    Type: AWS::EC2::SecurityGroupEgress
    Properties:
      Description: Allow open egress from MSK Cluster
      GroupId: !Ref TestSecurityGroup
      CidrIp: 0.0.0.0/0
      IpProtocol: '-1'
      FromPort: -1
      ToPort: -1

 # MSK Brokers Security Group Ingress EKS
 
  Testingress:
    Type: AWS::EC2::SecurityGroupIngress
    Properties:
      Description: Allows access 
      GroupId: !Ref TestSecurityGroup
      CidrIp: 100.10.10.0/16
      IpProtocol: 'tcp'
      FromPort: 9094
      ToPort: 9094
```


### 🔥 CloudFormation Hack: Safe Updates Without Impact! 🔥  Add a dummy resource using AWS::CloudFormation::WaitConditionHandle!
https://www.linkedin.com/posts/jaswanth-kumar-82442752_aws-cloudformation-devops-activity-7308552346332971008-QG9_?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAsY5dwBBjAiLoXax04wIhljWtvaVTgZ2CY

     
