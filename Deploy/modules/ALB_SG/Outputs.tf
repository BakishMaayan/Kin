# OutPut of ALB_SG
output "name" {
	value = "${aws_security_group.allowed_for_lb.id}"
}
