
locals {
  name = "aws"

  subnet_cidr_block = "10.0.4.0/24"
}


resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${local.name}-vpc"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_subnet" "public" {
  cidr_block = local.subnet_cidr_block
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name                  = "${local.name}-public-subnet"
    create_before_destroy = true
  }

  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
  }
}


resource "aws_instance" "aws" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.medium"

  tags = {
    Name = local.name
  }

  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
  }
}
