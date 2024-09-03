output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
  description = "The public IP address of the instance, if applicable."
}

output "private_ip" {
  value = aws_instance.this.private_ip
  description = "The private IP address of the instance."
}
