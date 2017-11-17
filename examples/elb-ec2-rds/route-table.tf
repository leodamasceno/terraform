resource "aws_route_table" "route-table" {
  vpc_id = "${aws_vpc.vpc-prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "aws_route_table"
  }
}

resource "aws_route_table_association" "route-table-association-subnet1" {
  subnet_id      = "${aws_subnet.prod-private-subnet1.id}"
  route_table_id = "${aws_route_table.route-table.id}"
}

resource "aws_route_table_association" "route-table-association-subnet2" {
  subnet_id      = "${aws_subnet.prod-private-subnet2.id}"
  route_table_id = "${aws_route_table.route-table.id}"
}
