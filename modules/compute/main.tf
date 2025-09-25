resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.aws_subnet
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.studycraft_key.key_name

  tags = {
    Name = var.ec2_name
  }
}

resource "aws_key_pair" "studycraft_key" {
  key_name   = var.key_name
  public_key = var.public_key_studycraft
}