variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "us-east-2"
}
variable "AMIS" {
	type = map(string)
	default = {
		us-east-2 = "ami-023c8dbf8268fb3ca"
	}
}

variable "PUBLIC_KEY_PATH" {
	default = "test.pub"
}

variable "PRIVATE_KEY_PATH" {
	default = "test"
}

variable "INSTANCE_USERNAME" {
	default = "ec2-user" 
}

variable "Instance-Name" {
	default = "webserver"
}


