resource "aws_vpc" "main-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    # DNS REQUIRED FOR EKS
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    tags = {
        Name = "main-vpc"
    }
}

output "main-vpc-id" {
  value = "${aws_vpc.main-vpc.id}"
  description = "VPC ID for Thomas Kubant"
}

resource "aws_subnet" "main-public-subnet-1b" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-1b"
    tags = {
      "Name" = "main-public-subnet-1b"
    }
}

resource "aws_subnet" "main-public-subnet-1c" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-1c"
    tags = {
      "Name" = "main-public-subnet-1c"
    }
}

resource "aws_subnet" "main-private-subnet-1b" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-1b"
    tags = {
      "Name" = "main-private-subnet-1a"
    }
}

resource "aws_subnet" "main-private-subnet-1c" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-1c"
    tags = {
      "Name" = "main-private-subnet-1b"
    }
}

resource "aws_db_subnet_group" "alinedb-tk-subnet-group" {
    name = "alinedb-tk-subnet-group"
    description = "Subnet group for aline db"
    subnet_ids = ["${aws_subnet.main-private-subnet-1b.id}", "${aws_subnet.main-private-subnet-1c.id}"]
}

resource "aws_internet_gateway" "main-gateway" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    tags = {
        Name = "main-gateway "
    }
}

resource "aws_route_table" "main-public-route-table" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gateway.id}"
    }
    tags = {
        Name = "main-public-route-table"
    }
}

resource "aws_route_table_association" "main-public-association-1a" {
    subnet_id = "${aws_subnet.main-public-subnet-1b.id}"
    route_table_id = "${aws_route_table.main-public-route-table.id}"
}

resource "aws_route_table_association" "main-public-association-1b" {
    subnet_id = "${aws_subnet.main-public-subnet-1c.id}"
    route_table_id = "${aws_route_table.main-public-route-table.id}"
}