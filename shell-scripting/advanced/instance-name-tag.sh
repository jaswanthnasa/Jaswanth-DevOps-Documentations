#!/bin/bash

#
# copy this into /etc/profile.d/instance-name-tag.sh
#
# you will need: 
# - curl, jq, and aws cli installed
# - an IAM role that gives the EC2 instance access to describe tags
#

## get instance info
INSTANCE=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document|jq .instanceId|tr -d '"')

## use region the instance is in as default region
export AWS_DEFAULT_REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document|jq .region|tr -d '"')

## make sure aws stuff is in the path
PATH="/opt/aws/bin:$PATH"

## grab the Name tag for this instance
NAMETAG=$(aws ec2 describe-tags --filters Name=resource-id,Values=$INSTANCE Name=key,Values=Name|jq ".Tags[0].Value"|tr -d '"')
export PS1="\\t [\\u@${NAMETAG} \\W]\\\$ "
