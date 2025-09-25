#Creating a AWS-VPC resource
resource "aws_vpc" "vpc_ap-south-1" {
   cidr_block = var.vpc_cidr
   region = var.region
   tags = {
       Name = var.vpc_name
   }
}
#Public Subnet-1 in AZ: ap-south-1a
resource "aws_subnet" "public_subnet-1" {
   vpc_id = aws_vpc.vpc_ap-south-1.id
   cidr_block = var.cidr_ip[0]
   availability_zone = var.az_name[0]
   tags = {
       Name = "Public_subnet-ap-south-1a"
   }
}
# Internet Gateway:
resource "aws_internet_gateway" "igw" {
   vpc_id = aws_vpc.vpc_ap-south-1.id
   tags = {
       Name = "main"
   }
}
#Route Table: Public
resource "aws_route_table" "public_RT" {
   vpc_id = aws_vpc.vpc_ap-south-1.id
   route {
       gateway_id = aws_internet_gateway.igw.id
       cidr_block = var.public_rt_cidr
   }
   tags = {
       Name = "Public-RT"
   }
}
resource "aws_route_table_association" "public_association_1" {
   subnet_id = aws_subnet.public_subnet-1.id
   route_table_id = aws_route_table.public_RT.id
}