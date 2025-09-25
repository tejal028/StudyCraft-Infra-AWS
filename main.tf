module "vpc-1" {
 source = "./modules/vpc"
 vpc_name = "studycraft-vpc"
 vpc_cidr = "10.0.0.0/16"
 cidr_ip = ["10.0.1.0/24"]
 az_name = ["ap-south-1a"]
 public_rt_cidr = "0.0.0.0/0"
 region = "ap-south-1"
}

module "sec-grp1" {
 source = "./modules/sec-grp"
 name = "studycraft-sec-grp-1"
 vpc_id = module.vpc-1.vpc_id
 ingress_rules = [
   {
     from_port  = 80
     to_port    = 80
     protocol   = "tcp"
     cidr_block = "0.0.0.0/0"
   },
   {
     from_port  = 443
     to_port    = 443
     protocol   = "tcp"
     cidr_block = "0.0.0.0/0"
   },
   {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_block = "0.0.0.0/0"
   }
 ]
 egress_rules = [
   {
     protocol   = "-1"
     cidr_block = "0.0.0.0/0"
   }
 ]
 tags = {
 Name = "sec-grp"
}
}
module "ec2" {
 source = "./modules/compute"
 ec2_ami = "ami-02d26659fd82cf299"
 ec2_instance_type = "t3.micro"
 ec2_name = "studycraft-server"
 aws_subnet = module.vpc-1.public_subnet-1_id
 associate_public_ip_address = true
 key_name = "studycraft-keypair"
 public_key_studycraft = file(var.private_key)
}