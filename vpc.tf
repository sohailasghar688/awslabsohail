# Internet VPC
resource "aws_vpc" "awslab-vpc" {
  cidr_block           = "172.16.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "awslab-vpc"
  }
}

# Subnets
resource "aws_subnet" "awslab-subnet-public" {
  vpc_id                  = aws_vpc.awslab-vpc.id
  cidr_block              = "172.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "awslab-subnet-public"
  }
}

resource "aws_subnet" "awslab-subnet-private" {
  vpc_id                  = aws_vpc.awslab-vpc.id
  cidr_block              = "172.16.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "awslab-subnet-private"
  }
}


# Internet GW
resource "aws_internet_gateway" "awslab-igw" {
  vpc_id = aws_vpc.awslab-vpc.id

  tags = {
    Name = "awslab-igw"
  }
}

# route tables
resource "aws_route_table" "awslab-rt-internet" {
  vpc_id = aws_vpc.awslab-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.awslab-igw.id
  }

  tags = {
    Name = "awslab-rt-internet"
  }
}

# route associations public
resource "aws_route_table_association" "awslab-1a" {
  subnet_id      = aws_subnet.awslab-subnet-public.id
  route_table_id = aws_route_table.awslab-rt-internet.id
}


