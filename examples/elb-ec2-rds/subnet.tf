resource "aws_subnet" "prod-private-subnet1" {
  vpc_id            = "${aws_vpc.vpc-prod.id}"
  cidr_block        = "${var.prod_private_subnet1_cidr}"
  availability_zone = "${var.prod_private_subnet1_az}"

  tags {
    Name = "prod-private-subnet"
  }
}

resource "aws_subnet" "prod-private-subnet2" {
  vpc_id     = "${aws_vpc.vpc-prod.id}"
  cidr_block = "${var.prod_private_subnet2_cidr}"
  availability_zone = "${var.prod_private_subnet2_az}"

  tags {
    Name = "prod-private-subnet"
  }
}
