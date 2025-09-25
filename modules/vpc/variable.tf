variable "vpc_cidr" {
   type = string
}
variable "vpc_name" {
   type = string
}
variable "region" {
  type = string
}
variable "cidr_ip" {
   type = list(string)
}
variable "az_name" {
   type = list(string)
}
variable "public_rt_cidr" {
   type = string
}