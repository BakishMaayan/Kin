# Connecting AWS

provider "aws" {
  region     = "us-east-1"
  access_key = "${var.Access_key}"
  secret_key = "${var.Secret_key}"
}


module "keys" {
  source = "./modules/keys"
  	#Variables
	key_name = "KinTest"
}

module "AppInstanceSG" {
  source = "./modules/AppInstanceSG"

}

module "ALB_SG" {
  source = "./modules/ALB_SG"

}

module "AppInstance" {
  source = "./modules/AppInstance"
	#Variables  
  	AppInstanceCount = "2"
	key_name = "${module.keys.key_name}"
	availability_zone = ["us-east-1a", "us-east-1b"]
	security_groups = "${module.AppInstanceSG.name}"
}

module "ALB" {
  source = "./modules/ALB"
	#Variables  
	security_groups = "${module.ALB_SG.name}"
	subnet_id = ["${module.AppInstance.subnet_id}"]
	PubIP = ["${module.AppInstance.PubIP}"]
	instances_id = "${module.AppInstance.id}"
	vpc_id = "${module.AppInstanceSG.vpc_id}"
	playbook_path = "${var.playbook_path}"
}

