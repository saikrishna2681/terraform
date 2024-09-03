# Create the VPC
resource "aws_vpc" "this" {
  cidr_block              = var.cidr_block
  enable_dns_support      = true
  enable_dns_hostnames    = true
  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

# Create an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Create a NAT Gateway
resource "aws_eip" "nat" {
  count = var.create_nat_gateway ? 1 : 0
}

resource "aws_nat_gateway" "this" {
  count = var.create_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "${var.vpc_name}-nat"
  }
}

# Create Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rtb"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.create_nat_gateway ? aws_nat_gateway.this[0].id : null
  }

  tags = {
    Name = "${var.vpc_name}-private-rtb"
  }
}

# Associate Route Tables with Subnets
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidrs)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

data "aws_availability_zones" "available" {}


resource "aws_security_group" "public" {
  name = "${var.environment}-${var.project_name}"
  description = var.sg_description
  vpc_id = aws_vpc.this.id
 
  tags = {
    Name        = "${var.environment}-${var.project_name}"
    Environment = var.environment
    
  }
}
 
resource "aws_security_group_rule" "public_out" {
  type        = var.egress_rule
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.public.id
}
 
resource "aws_security_group_rule" "public_in_ssh" {
  type              = var.ingress_rule
  from_port         = var.ssh_from_port
  to_port           = var.ssh_to_port
  protocol          = var.tcp_protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
 
resource "aws_security_group_rule" "public_in_http" {
  type              = var.ingress_rule
  from_port         = var.http_from_port
  to_port           = var.http_to_port
  protocol          = var.tcp_protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
 
resource "aws_security_group_rule" "public_in_https" {
  type              = var.ingress_rule
  from_port         = var.https_from_port
  to_port           = var.https_from_port
  protocol          = var.tcp_protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
  
