resource "aws_vpc" "main" {
  cidr_block       = var.main_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "main-subnet"
   }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "private-subnet"
   }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_internet_gateway_attachment" "vpc-igw-attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main.id
}

resource "aws_route_table" "subnet-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_subnet_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "subnet-route-table"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.subnet-route-table.id
}

resource "aws_route_table" "private-subnet-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-subnet-route-table"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private-subnet-route-table.id
}



