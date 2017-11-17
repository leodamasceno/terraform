# S3 configuration to store the tfstate file remotely
terraform {
  backend "s3" {
    bucket = "bwn-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = "true"
  }
}
