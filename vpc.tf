resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
resource "aws_subnet" "test_subnet2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"  
  map_public_ip_on_launch = true
}
resource "aws_subnet" "test_subnet3" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"  
  map_public_ip_on_launch = true
}
resource "aws_subnet" "test_subnet4" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1d"  
  map_public_ip_on_launch = false
}
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id
}
resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }
}
resource "aws_route_table_association" "test_rta" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_rt.id
}