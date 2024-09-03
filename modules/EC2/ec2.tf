resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name       = var.key_name
  subnet_id     = var.subnet_id
  security_groups = var.security_groups

  tags = {
    Name = var.instance_name
  }

  # Optional: Enable EBS optimization
  ebs_optimized = var.ebs_optimized

  # Optional: Specify user data for initialization scripts
  user_data = var.user_data

  # Optional: Block device mappings
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    delete_on_termination = true
  }

  # Optional: Associate Elastic IP if specified
  #associate_public_ip_address = var.associate_public_ip

}

# Optional: Create an Elastic IP and associate it with the instance
resource "aws_eip" "this" {
  count = var.associate_public_ip ? 1 : 0

  instance = aws_instance.this.id
}

resource "aws_network_interface_attachment" "this" {
  count = var.network_interface_id != "" ? 1 : 0

  network_interface_id = var.network_interface_id
  instance_id          = aws_instance.this.id
  device_index         = 0
}




