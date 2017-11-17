# Provider variables
variable "aws_access_key" {
  default = "[REPLACE_AWS_ACCESS_KEY]"
}

variable "aws_secret_key" {
  default = "[REPLACE_AWS_SECRET_KEY]"
}

variable "aws_region" {
  default = "us-east-1"
}

# VPC and Subnet variables
variable "vpc_prod_cidr" {
  default = "10.0.0.0/16"
}

variable "prod_private_subnet1_cidr" {
  default = "10.0.0.0/24"
}

variable "prod_private_subnet2_cidr" {
  default = "10.0.1.0/24"
}

variable "prod_private_subnet1_az" {
  default = "us-east-1a"
}

variable "prod_private_subnet2_az" {
  default = "us-east-1b"
}

# ELB variables
variable "application_elb_name" {
  default = "app-application-elb"
}

variable "application_elb_log_bucket_prefix" {
  default = "elb-logs"
}

# EC2 variables
variable "instance_lc_name" {
  default = "application-lc"
}

variable "instance_lc_ami" {
  default = "ami-8c1be5f6"
}

variable "instance_lc_type" {
  default = "t2.micro"
}

variable "instance_lc_key_name" {
  default = "application"
}

variable "instance_asg_name" {
  default = "application-asg"
}

# RDS
variable "rds_instances_count" {
  default = 1
}

variable "rds_cluster_name" {
  default = "application-db-cluster"
}

variable "rds_instance_name" {
  default = "application-db"
}

variable "rds_instance_type" {
  default = "db.r4.large"
}

variable "rds_cluster_az" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "rds_db_name" {
  default = "application_db"
}

variable "rds_admin_user" {
  default = "app_master"
}

variable "rds_admin_pw" {
  default = "nJakLiYt91Ba3"
}
