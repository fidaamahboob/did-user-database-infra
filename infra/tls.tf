resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content         = tls_private_key.bastion_key.private_key_pem
  filename        = "${path.module}/bastion_key.pem"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.bastion_key.public_key_openssh
  filename        = "${path.module}/bastion_key.pub"
  file_permission = "0644"
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = tls_private_key.bastion_key.public_key_openssh
}