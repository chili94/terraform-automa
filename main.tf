provider "aws" {
  region = var.aws_region
}


#--IAM--#

#---s3_access---

resource "aws_iam_instance_profile" "s3_access_profile" {
  name = "s3_pristup"
  role = aws_iam_role.s3_access_role.name
}

resource "aws_iam_role_policy" "s3_access_policy" {
  name = "s3_pristup_policy"
  role = aws_iam_role.s3_access_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
     {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": "*"
        }
  ]
}
EOF
}

resource "aws_iam_role" "s3_access_role" {
  name = "s3_pristup_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
         "Service": "ec2.amazonaws.com"
    },
    "Effect": "Allow",
    "Sid": ""
  }
 ]
}
EOF
}




#--VPC--#

resource "aws_vpc" "wp_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-wordpress"
  }
}


#---internet gateway---

resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = aws_vpc.wp_vpc.id

  tags = {
    Name = "InternetGateway-wp"
  }
}

#---route tables---

resource "aws_route_table" "wp_public_rt" {
  vpc_id = aws_vpc.wp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_internet_gateway.id
  }

  tags = {
    Name = "wp_public"
  }
}

resource "aws_default_route_table" "wp_private_rt" {
  default_route_table_id = aws_vpc.wp_vpc.default_route_table_id

  tags = {
    Name = "wp_private"
  }
}

#---Subnets---


resource "aws_subnet" "wp_public1_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["public1"]
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "wp_public1"
  }
}


resource "aws_subnet" "wp_public2_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["public2"]
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "wp_public2"
  }
}

resource "aws_subnet" "wp_private1_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["private1"]
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "wp_private1"
  }
}

resource "aws_subnet" "wp_private2_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["private2"]
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags = {
    Name = "wp_private2"
  }
}

resource "aws_subnet" "wp_rds1_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["rds1"]
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "wp_rds1"
  }
}

resource "aws_subnet" "wp_rds2_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["rds2"]
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags = {
    Name = "wp_rds2"
  }
}

resource "aws_subnet" "wp_rds3_sub" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = var.cidrs["rds3"]
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags = {
    Name = "wp_rds3"
  }
}

#---rds subnet group---


resource "aws_db_subnet_group" "wp_rds_subnetgroup" {
  name = "rds_subnetgroup"

  subnet_ids = [aws_subnet.wp_rds1_sub.id, 
    aws_subnet.wp_rds2_sub.id, 
    aws_subnet.wp_rds3_sub.id
  ]

  tags = {
    Name = "wp_rds_subgroup"
  }
}

#---subnet associations---

resource "aws_route_table_association" "wp_public1_assoc" {
  subnet_id = aws_subnet.wp_public1_sub.id
  route_table_id = aws_route_table.wp_public_rt.id
}

resource "aws_route_table_association" "wp_public2_assoc" {
  subnet_id = aws_subnet.wp_public2_sub.id
  route_table_id = aws_route_table.wp_public_rt.id
}


resource "aws_route_table_association" "wp_private1_assoc" {
  subnet_id = aws_subnet.wp_private1_sub.id
  route_table_id = aws_default_route_table.wp_private_rt.id
}


resource "aws_route_table_association" "wp_private2_assoc" {
  subnet_id = aws_subnet.wp_private2_sub.id
  route_table_id = aws_default_route_table.wp_private_rt.id
}


















