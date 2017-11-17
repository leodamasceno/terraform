resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  engine               = "aurora-postgresql"
  count                = "${var.rds_instances_count}"
  identifier           = "${var.rds_instance_name}-${count.index}"
  cluster_identifier   = "${aws_rds_cluster.rds_cluster.id}"
  instance_class       = "${var.rds_instance_type}"
}

resource "aws_db_subnet_group" "rds_private_db_subnet" {
  name        = "db-private-subnet"
  description = "Private subnets for RDS instance"
  subnet_ids  = [ "${aws_subnet.prod-private-subnet1.id}", "${aws_subnet.prod-private-subnet2.id}" ]
}

resource "aws_rds_cluster" "rds_cluster" {
  engine                  = "aurora-postgresql"
  cluster_identifier      = "${var.rds_cluster_name}"
  availability_zones      = "${var.rds_cluster_az}"
  vpc_security_group_ids  = ["${aws_security_group.application-rds-sg.id}"]
  database_name           = "${var.rds_db_name}"
  master_username         = "${var.rds_admin_user}"
  master_password         = "${var.rds_admin_pw}"
  db_subnet_group_name    = "${aws_db_subnet_group.rds_private_db_subnet.name}"
  skip_final_snapshot     = "true"
}
