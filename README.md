This is a small demo for the running the node.js  app in ECS fargate gate.

Remote Backend as S3 bucket with out dynamo db for state lock file .

Used modules for VPC and RDS .

Used terraform_remote_state as data source.

Used Variables inputs from vars/terraform.tfavrs file

We had created the image for the app in Nodejs and uploaded it to the repository

This configuration contains the fallowing creation

VPC with 2 private and 2 public subnets

IAM for ECS 

RDS inatance

Taskdefinition with the image required

Service for the running the task to maintain desied state

Laod balance 

rout 53 with zones and A record

Autoscaling group.

Used separate module for network and RDS instance to avoid frequent modifications 
whihile changing service and task definitions

Will update usage of resource from module soon.
