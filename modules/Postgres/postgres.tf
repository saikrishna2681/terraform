resource "aws_db_subnet_group" "this" {
  name        = "${var.name}-subnet-group"
  description = "Database subnet group"

  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.postgres.id]

  tags = {
    Name = var.db_name
  }

  skip_final_snapshot = true
}


resource "aws_security_group" "postgres" {
  name = "${var.environment}-${var.db_sg}"
  description = var.sg_description
  vpc_id = var.vpc_id
 
  tags = {
    Name        = "${var.environment}-${var.db_sg}"
    Environment = var.environment
    
  }
}
 
resource "aws_security_group_rule" "public_out" {
  type        = var.egress_rule
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.postgres.id
}
 
resource "aws_security_group_rule" "public_in_ssh" {
  type              = var.ingress_rule
  from_port         = var.postgres_from_port
  to_port           = var.postgres_to_port
  protocol          = var.tcp_protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.postgres.id
}
 

