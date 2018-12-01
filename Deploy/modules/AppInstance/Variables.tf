#Variables for AppInstances creation

#The AppInstances count
variable "AppInstanceCount" {
  type    = "string"
  default = "2"
}

#The SSH key
variable "key_name" {
  type    = "string"
}

#The intances availability zone
variable "availability_zone" {
  type    = "list"
}

#The intances SG
variable "security_groups" {
  type    = "string"
}

