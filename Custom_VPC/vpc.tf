# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Custom_VPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "Custom_IG"
  }
}

resource "aws_eip" "nat"{
  vpc = true
}

#Nat Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  depends_on = [aws_internet_gateway.terra_igw]
  tags = {
    Name = "Custome_NATGW"
  }
}

# Subnets : public
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = var.public_subnets_cidr
  map_public_ip_on_launch = "true"
  availability_zone = var.public_azs
  tags = {
    Name = "Public_Subnet"
  }
}

# Subnets : private
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = var.private_subnets_cidr
  availability_zone = var.private_azs
  tags = {
    Name = "Private_Subnet"
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "PublicRouteTable"
  }
}

# Route table: attach NAT Gateway 
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "PrivateRouteTable"
  }
}

# Route table association with private subnets
resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}


# Route table association with public subnets
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}