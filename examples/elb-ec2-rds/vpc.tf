resource "aws_vpc" "vpc-prod" {
  cidr_block       = "${var.vpc_prod_cidr}"

  tags {
    Name = "vpc-prod"
  }
}
