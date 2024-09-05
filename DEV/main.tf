module "s3-bucket"{
    source = "/Users/saikrishnaogubina/my-git/terraform/modules/S3"
    name = var.name
    environment = var.environment
    days = var.days
    storage_class = var.storage_class
}
output "s3_arn" {
  value       = module.s3-bucket.s3_arn
  description = "The id of S3"
}
#testing1
/*

module "vpc" {
  source                = "E:\\TERRAFORM\\AWS-Terraform\\modules\\VPC"
  cidr_block            = var.cidr_block
  vpc_name              = var.vpc_name
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  create_nat_gateway    = true

  environment = var.environment
  project_name = var.project_name
  sg_description = var.sg_description

  egress_rule = var.egress_rule
  ingress_rule = var.ingress_rule

  ssh_from_port = var.ssh_from_port
  ssh_to_port = var.ssh_to_port
  tcp_protocol = var.tcp_protocol
  http_from_port = var.http_from_port
  http_to_port = var.http_to_port
  https_from_port = var.https_from_port
  https_to_port = var.https_to_port

}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_public" {
  value = module.vpc.security_group_public
}


output "instance_id" {
  value = module.ec2_instance.instance_id
}

data "aws_key_pair" "example" {
  key_name = "dev-miq"  # Replace with your actual key pair name
}

module "ec2_instance" {
  source              = "E:\\TERRAFORM\\AWS-Terraform\\modules\\EC2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = data.aws_key_pair.example.key_name
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_groups     = [module.vpc.security_group_public]
  instance_name       = var.instance_name
  ebs_optimized       = true
  #user_data           = file("init-script.sh")
  root_volume_size    = 20
  root_volume_type    = "gp3"
  associate_public_ip = true
  #network_interface_id = ""  # Specify if you have an additional network interface
  #security_group_name   = "my-security-group"
  #security_group_description = "A security group for my instances."
  vpc_id                = module.vpc.vpc_id
}
*/
/*

data "aws_subnet_ids" "private" {
  filter {
    name   = "tag:Type"
    values = ["private"]
  }
}

*/

/*
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow access to PostgreSQL DB"
  vpc_id      =  module.vpc.vpc_id
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "postgres" {
  source              = "E:\\TERRAFORM\\AWS-Terraform\\modules\\Postgres"
  name                = var.name
  db_name             = var.db_name
  username            = var.username
  password            = var.password
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  storage_type        = var.storage_type
  vpc_security_group_ids = [module.postgres.security_group_postgres]
  subnet_ids          = module.vpc.public_subnet_ids
  vpc_id              = module.vpc.vpc_id
  environment = var.environment
  db_sg = var.db_sg
  sg_description = var.sg_description

  egress_rule = var.egress_rule
  ingress_rule = var.ingress_rule

  postgres_to_port = var.postgres_to_port
  postgres_from_port = var.postgres_from_port
  tcp_protocol = var.tcp_protocol
}

output "security_group_postgres" {
  value = module.postgres.security_group_postgres
}
*/
/*

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}

*/

/*
output "db_instance_endpoint" {
  description = "The endpoint of the PostgreSQL instance."
  value       = module.postgres.db_instance_endpoint
}

output "db_instance_arn" {
  description = "The ARN of the PostgreSQL instance."
  value       = module.postgres.db_instance_arn
}




output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}




*/