output "db_endpoint" {
  value = aws_db_instance.mydb.address
}

output "api_url" {
  value = "${aws_api_gateway_stage.stage.invoke_url}/data"
}

output "ec2_bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
