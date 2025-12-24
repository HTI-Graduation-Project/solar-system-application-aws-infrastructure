resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "public_AZ1" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/19"
  availability_zone       = local.AZ1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                    = local.public_subnet_AZ1_name
    "kubernetes.io/role/elb"                  = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }

}

resource "aws_subnet" "public_AZ2" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.32.0/19"
  availability_zone       = local.AZ2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                    = local.public_subnet_AZ1_name
    "kubernetes.io/role/elb"                  = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }

}


resource "aws_subnet" "private_AZ1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.64.0/19"
  availability_zone = local.AZ1
  tags = {
    "Name"                                    = local.private_subnet_AZ1_name
    "kubernetes.io/role/internal-elb"         = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"

  }
}


resource "aws_subnet" "private_AZ2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.96.0/19"
  availability_zone = local.AZ2
  tags = {
    "Name"                                    = local.private_subnet_AZ2_name
    "kubernetes.io/role/internal-elb"         = "1"
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }

}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_AZ1.id

  tags = {
    Name = "public NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}
resource "aws_eip" "eip" {

  domain = "vpc"

  tags = {
    Name = "nat"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "public_route"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_AZ1" {
  subnet_id      = aws_subnet.public_AZ1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_AZ2" {
  subnet_id      = aws_subnet.public_AZ2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "private_route"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

}

resource "aws_route_table_association" "private_AZ1" {
  subnet_id      = aws_subnet.private_AZ1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_AZ2" {
  subnet_id      = aws_subnet.private_AZ2.id
  route_table_id = aws_route_table.private.id
}