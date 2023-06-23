provider "aws" {
    region="us-east-2"
    }
resource "aws_vpc" "vpc" {
    cidr_block = "192.168.0.0/16"
      
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "primary" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "192.168.0.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]  #  or "us-east-2a"

}


###EC2

resource "aws_instance" "ec2" {
    subnet_id = aws_subnet.primary.id ## or id can take from aws console and put here
  
}