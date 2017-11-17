# Terraform

## Dependencies:
- Create an IAM user named bot-terraform and add it permissions to manage all the resources (EC2, RDS, S3, etc)
- Create an Access Key for the bot-terraform use it and replace the current ones in the vars.tf file

### Examples
All the examples in this repostory are listed below:
- elb-ec2-rds: It creates an ELB with two EC2 instances attached to it, allowing these instances to talk to a RDS instance. Customize the configuration changing the vars.tf file.

## Running terraform
You can see the current status of your infrastructure by typing:
```
# terraform plan
```
It will show you if there are any changes to be applied.

If you change the files, maybe because you added a new resource or changed an existent resource, you will need to do a plan first (Command above) and then apply these changes:
```
# terraform apply
```

You need to be in the terraform directory, it will not work otherwise.
