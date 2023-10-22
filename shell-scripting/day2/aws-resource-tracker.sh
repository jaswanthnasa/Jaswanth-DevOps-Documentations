#!/bin/bash

##################################
# Author: Jaswanth
# Date: 22/10/23
# version: v1
########
# Description: to track aws-respuces 
##################################

set -x
aws s3 ls
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'   # jq is a json parser similar to yq (yaml parser)
aws lambda list-functions
aws iam list-users
