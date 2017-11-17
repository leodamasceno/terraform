resource "aws_security_group" "application-web-sg" {
  name        = "application-web-sg"
  description = "Allow inbound traffic on the port 8080"
  vpc_id      = "${aws_vpc.vpc-prod.id}"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elb-web-sg" {
  name        = "elb-web-sg"
  description = "Allow inbound traffic on the port 80"
  vpc_id      = "${aws_vpc.vpc-prod.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application-admin-sg" {
  name        = "application-admin-sg"
  description = "Allow inbound traffic on the admin ports"
  vpc_id      = "${aws_vpc.vpc-prod.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application-rds-sg" {
  name        = "application-rds-sg"
  description = "Allow inbound traffic on the port 5432 from subnets"
  vpc_id      = "${aws_vpc.vpc-prod.id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.prod_private_subnet1_cidr}"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.prod_private_subnet2_cidr}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
