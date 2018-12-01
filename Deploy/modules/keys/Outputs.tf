# OutPut of key_name
output "key_name" {
	value = "${aws_key_pair.generated_key.key_name}"
}