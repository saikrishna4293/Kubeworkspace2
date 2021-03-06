#! /bin/bash

kops create cluster \
    --cloud=aws \
    --dns=private \
    --dns-zone=k8s.krishnalabs.com \
    --zones=us-east-1a,us-east-1b \
    --master-count=3 \
    --master-size=t2.micro \
    --master-zones=us-east-1a,us-east-1b \
    --master-volume-size=10 \
    --node-count=2 \
    --node-size=t2.micro \
    --node-volume-size=20 \
    --network-cidr=172.33.0.0/16 \
    --ssh-public-key='~/.ssh/id_rsa.pub' \
    --networking=calico \
    --kubernetes-version=1.8.6 \
    --topology=private \
    --associate-public-ip=false \
    --bastion=true \
    --state=s3://krishna-labs \
    --name=labs.k8s.krishnalabs.com \
    --authorization=rbac \
    --encrypt-etcd-storage
