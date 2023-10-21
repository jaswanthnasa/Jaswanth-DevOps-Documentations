#!/bin/bash

############################
# Author: Jaswanth
# Date: 21/10/23
# version: v1
# Description: Script to get node health
############################

set -x # to open in debug mode
set -e # exit the spript when there is an error
set -o pipefail


df -h
free -g
nproc
# ps -ef
ps -ef | grep bash | awk -F " " '{print $3}'