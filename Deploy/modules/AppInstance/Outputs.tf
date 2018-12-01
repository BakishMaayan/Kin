# OutPut of instances
output "id" {
	value = ["${aws_instance.pythonapp.*.id}"]
}

output "subnet_id" {
	value = ["${aws_instance.pythonapp.*.subnet_id}"]
}

output "PubIP" {
	value = ["${aws_instance.pythonapp.*.public_ip}"]
}