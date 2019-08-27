output "instance_id" {
  value = aws_instance.image_test.id
}

output "instance_public_ip" {
  value = aws_instance.image_test.public_ip
}

output "instance_public_hostname" {
  value = aws_instance.image_test.public_dns
}

output "instance_private_ip" {
  value = aws_instance.image_test.private_ip
}

output "instance_private_hostname" {
  value = aws_instance.image_test.private_dns
}