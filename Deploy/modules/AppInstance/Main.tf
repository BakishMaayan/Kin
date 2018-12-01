resource "aws_instance" "pythonapp" {
	count="${var.AppInstanceCount}"
	ami = "ami-059eeca93cf09eebd"
	instance_type = "t2.micro"
	key_name      = "${var.key_name}"
	availability_zone = "${element(var.availability_zone, count.index)}"
	security_groups      = ["${var.security_groups}"]
	user_data = "${file("/home/ubuntu/Kin/terra/pubkey")}"
}
