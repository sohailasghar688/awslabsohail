resource "aws_security_group" "awslab-webserver-sg" {
    vpc_id = "${aws_vpc.awslab-vpc.id}"
    name = "awslab-webserver-sg"
    description = "allow HTTP ICMP and SSH publicly"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow all outbound traffic"
      from_port = 0
      protocol = "-1"
      self = false
      to_port = 0
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow ssh access publicly"
        from_port = 22
        to_port = 22
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow http access publicly"
        from_port = 80
        to_port = 80
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0"]
        description = "allow imcp traffic"
        from_port = -1
        protocol = "icmp"
        to_port = -1
        self = false
    }
    tags = {
      "Name" = "awslab-webserver-sg"
    }
}


resource "aws_security_group" "awslab-database-sg" {
    vpc_id = "${aws_vpc.awslab-vpc.id}"
    name = "awslab-database-sg"
    description = "allow ssh access from local"
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow all outbound traffic"
      from_port = 0
      protocol = "-1"
      self = false
      to_port = 0
    }
    ingress {
        cidr_blocks = ["172.16.1.0/24"]
        description = "allow ssh database port from public subnet"
        from_port = 3110
        to_port = 3110
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = ["172.16.1.0/24"]
        description = "allow ssh access from public subnet"
        from_port = 22
        to_port = 22
        self = false
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0"]
        description = "allow imcp traffic"
        from_port = -1
        protocol = "icmp"
        to_port = -1
        self = false
    }
    tags = {
      "Name" = "awslab-database-sg"
    }
}

