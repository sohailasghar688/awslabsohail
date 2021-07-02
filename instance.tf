resource "aws_key_pair" "test" {
	key_name = "test"
	public_key = file(var.PUBLIC_KEY_PATH)
}

#############    EC2 Instance For Webserver in Public Subnet ##########

resource "aws_instance" "awslab-webserver" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	subnet_id = aws_subnet.awslab-subnet-public.id
	vpc_security_group_ids = [aws_security_group.awslab-webserver-sg.id]
	key_name = aws_key_pair.test.key_name
	tags = {
		Name = "awslab-webserver"
  }
}

#############    EC2 Instance For Database in Pvt Subnet ##########

resource "aws_instance" "awslab-database" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	subnet_id = aws_subnet.awslab-subnet-private.id
	vpc_security_group_ids = [aws_security_group.awslab-database-sg.id]
	key_name = aws_key_pair.test.key_name

	tags = {
		Name = "awslab-database"
  }
}
