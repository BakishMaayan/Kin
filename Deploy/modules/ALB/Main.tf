# Create a new load balancer
resource "aws_lb" "ALB" {
  name               = "Terraform-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups}"]

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  subnet_mapping {
    subnet_id     = "${element(var.subnet_id, count.index)}"
  }

  subnet_mapping {
    subnet_id     = "${element(var.subnet_id, count.index + 1)}"
  }
}

# Create a listener for the ALB
resource "aws_lb_listener" "ALB_listener" {
  load_balancer_arn = "${aws_lb.ALB.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
  }
}

# Create Target_Group
resource "aws_lb_target_group" "target_group" {
  name     = "WEBtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

# Attach instances to target group
resource "aws_lb_target_group_attachment" "test" {
  count 	   = "2"
  target_group_arn = "${aws_lb_target_group.target_group.arn}"
  target_id        = "${element(var.instances_id, count.index)}"
  port             = 80

        provisioner "local-exec"{
                command = "sudo echo ${element(var.PubIP, count.index)}  >> /etc/ansible/hosts"
         }

        provisioner "local-exec"{
		command = "sleep 120; ansible-playbook ${var.playbook_path} --limit ${element(var.PubIP, count.index)}"
         }
}
