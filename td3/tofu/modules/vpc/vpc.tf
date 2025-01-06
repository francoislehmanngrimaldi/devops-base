resource "aws_vpc" "sample_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_internet_gateway" "sample_igw" {
  vpc_id = aws_vpc.sample_vpc.id
  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route_table" "sample_route_table" {
  vpc_id = aws_vpc.sample_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample_igw.id
  }

  tags = {
    Name = "${var.name}-route-table"
  }
}

resource "aws_subnet" "sample_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.sample_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.sample_vpc.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-subnet-${count.index + 1}"
  }
}

resource "aws_route_table_association" "sample_route_table_association" {
  count          = 2
  subnet_id      = aws_subnet.sample_subnet[count.index].id
  route_table_id = aws_route_table.sample_route_table.id
}
