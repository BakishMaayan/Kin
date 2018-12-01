# OutPut of intancesSG
output "name" {
	value = "${aws_security_group.allowed_for_vm.name}"
}

output "vpc_id" {
	value = "${aws_security_group.allowed_for_vm.vpc_id}"
}



