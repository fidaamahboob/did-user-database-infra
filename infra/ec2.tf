resource "aws_instance" "bastion" {
  ami           = "ami-024294779773cf91a"  
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name        = aws_key_pair.bastion.key_name
  associate_public_ip_address = true
  tags = { Name = "bastion-host" }
}

