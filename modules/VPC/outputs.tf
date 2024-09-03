output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this[0].id
  description = "The ID of the NAT Gateway, if created."
  #condition = var.create_nat_gateway
}

output "security_group_public" {
  value = aws_security_group.public.id
}