provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "development_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name: "development",
    vpc_env: "dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name: "subnet-1-dev"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development_vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}

#data "aws_vpc" "existing-vpc" {
#  default = true
#}

#resource "aws_subnet" "dev-subnet-2" {
#  vpc_id = data.aws_vpc.existing-vpc.id
#  cidr_block = "172.31.96.0/20"
#  availability_zone = "us-east-1a"
#  tags = {
#    Name: "subnet-2-dev"
#  }
#}

