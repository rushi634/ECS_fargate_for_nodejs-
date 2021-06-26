resource "aws_vpc" "intel_vpc" {
cidr_block = var.vpc_cidr
}
resource "aws_subnet" "intel_private-subnet1" {
vpc_id = aws_vpc.intel_vpc.id
cidr_block = var.private_subnet1
availability_zone = var.subnet_zone1
}
resource "aws_subnet" "intel_private-subnet2" {
vpc_id = aws_vpc.intel_vpc.id
cidr_block = var.private_subnet2
availability_zone = var.subnet_zone2
}
resource "aws_subnet" "intel_subnet1" {
vpc_id = aws_vpc.intel_vpc.id
cidr_block = var.public_subnet1
availability_zone = var.subnet_zone1
map_public_ip_on_launch = true
}
resource "aws_subnet" "intel_subnet2" {
vpc_id = aws_vpc.intel_vpc.id
cidr_block = var.public_subnet2
availability_zone = var.subnet_zone2
map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.intel_vpc.id
}

resource "aws_db_subnet_group" "db-subnet-group" {
name = "db subnet group"
subnet_ids = [aws_subnet.intel_private-subnet1.id , aws_subnet.intel_private-subnet2.id]
}
resource "aws_security_group" "intel-sgp" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = aws_vpc.intel_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.intel_vpc.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}



