resource "aws_launch_configuration" "instance_lc" {
  name_prefix                 = "${var.instance_lc_name}"
  image_id                    = "${var.instance_lc_ami}"
  instance_type               = "${var.instance_lc_type}"
  security_groups             = ["${aws_security_group.application-web-sg.id}", "${aws_security_group.application-admin-sg.id}"]
  user_data                   = "${file("user_data/app-config.sh")}"
  key_name                    = "${var.instance_lc_key_name}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "instance-asg" {
  depends_on = ["aws_elb.application-elb"]
  name                      = "${var.instance_asg_name}"
  launch_configuration      = "${aws_launch_configuration.instance_lc.name}"
  vpc_zone_identifier       = ["${aws_subnet.prod-private-subnet1.id}, ${aws_subnet.prod-private-subnet2.id}"]
  load_balancers            = ["${aws_elb.application-elb.id}"]
  wait_for_capacity_timeout = "2m"
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  load_balancers            = ["${aws_elb.application-elb.id}"]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key = "Name"
    value = "${var.instance_asg_name}"
    propagate_at_launch = true
  }
}
