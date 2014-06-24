#!/bin/bash

function bastion {
   aws ec2 describe-instances --filter Name=tag:Name,Values=NAT-PUB-A --output table |grep "|||  PublicIpAddress" |awk '{print $4}'
}

bastion
