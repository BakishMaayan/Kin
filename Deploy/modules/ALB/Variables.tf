#Variables for ALB creation

#The ALB's SG
variable "security_groups" {
  type    = "string"
}

#The ALB's subnet_id
variable "subnet_id" {
  type    = "list"
}

#The ALB's PubIP
variable "PubIP" {
  type    = "list"
}


#The ALB's instances_id
variable "instances_id" {
  type    = "list"
}

#The ALB's vpc_id
variable "vpc_id" {
  type    = "string"
}

#PlayBook path
variable "playbook_path" {
  type    = "string"
}

