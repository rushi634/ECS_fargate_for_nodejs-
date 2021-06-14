This is a small demo for the running the node js  app in ECS fargate gate

We had the created the image for the app in Nodejs and uploaded it to the repository

This configuration contains the fallowing creation
    VPC with 2 private and 2 public subnets
    IAM for ECS 
    RDS inatance
    Taskdefinition with the image required
    Service for the running the task to maintain desied state
    Laod balance 
    rout 53 with zones and A record

Variables are stored in ./vars/terraform.tfvvars for re-uasbility of the configuration.

modules are not used in this demo,we can use separate module for network and RDS instance to avoid frequent modifications 
whihile changing service and task definitions