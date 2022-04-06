terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# --------------------  Provider  ----------------------

provider "aws" {
  region = "ap-northeast-1"
}

# --------------------  VPC  ----------------------

resource "aws_vpc" "Jonathan-vpc" {
  cidr_block = "192.168.5.0/24"

  tags = {
    Name = "Jonathan_VPC"
    type = "VPC"
  }
}

# --------------------  Subnets  ----------------------

resource "aws_subnet" "Subnet_Web_tier" {
  vpc_id = aws_vpc.Jonathan-vpc.id
  cidr_block = "192.168.5.0/27"

  tags = {
    Name = "Subnet_Web_tier"
    type = "subnet"
  }
}

resource "aws_subnet" "Subnet_App_tier" {
  vpc_id = aws_vpc.Jonathan-vpc.id
  cidr_block = "192.168.5.32/27"

  tags = {
    Name = "Subnet_App_tier"
    type = "subnet"
  }
}

resource "aws_subnet" "Subnet_DB_tier" {
  vpc_id = aws_vpc.Jonathan-vpc.id
  cidr_block = "192.168.5.64/28"

  tags = {
    Name = "Subnet_DB_tier"
    type = "subnet"
  }
}