output "vpc_id" {
 value = aws_vpc.vpc_ap-south-1.id
}
output "public_subnet-1_id" {
   value = aws_subnet.public_subnet-1.id
}
output "igw_id" {
 value = aws_internet_gateway.igw.id
}
output "public_rt_id" {
 value = aws_route_table.public_RT.id
}