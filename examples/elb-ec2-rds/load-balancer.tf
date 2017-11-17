resource "aws_elb" "application-elb" {
  name               = "${var.application_elb_name}"
#  availability_zones = "${var.application_elb_zones}"
  subnets            = ["${aws_subnet.prod-private-subnet1.id}", "${aws_subnet.prod-private-subnet2.id}"]
  security_groups = ["${aws_security_group.elb-web-sg.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.application_elb_name}"
  }
}
