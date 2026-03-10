resource "aws_vpc" "vpc_git" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subpub" {
  vpc_id            = aws_vpc.vpc_git.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subpub_2" {
  vpc_id            = aws_vpc.vpc_git.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "subpriv" {
  vpc_id            = aws_vpc.vpc_git.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "subpriv2" {
  vpc_id            = aws_vpc.vpc_git.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1d"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_git.id
}

resource "aws_route_table" "art" {
  vpc_id = aws_vpc.vpc_git.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rti" {
  subnet_id      = aws_subnet.subpub.id
  route_table_id = aws_route_table.art.id
}

resource "aws_route_table_association" "rti_2" {
  subnet_id      = aws_subnet.subpub_2.id
  route_table_id = aws_route_table.art.id
}

resource "aws_route_table" "rtb_priv" {
  vpc_id = aws_vpc.vpc_git.id
}


resource "aws_route_table_association" "rti_priv_1" {
  subnet_id      = aws_subnet.subpriv.id
  route_table_id = aws_route_table.rtb_priv.id
}

resource "aws_route_table_association" "rti_priv_2" {
  subnet_id      = aws_subnet.subpriv2.id
  route_table_id = aws_route_table.rtb_priv.id
}

