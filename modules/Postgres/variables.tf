variable "name" {
  description = "The name of the PostgreSQL instance."
  type        = string
}

variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "username" {
  description = "The master username for the database."
  type        = string
}

variable "password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "The version of the PostgreSQL engine."
  type        = string
  default     = "13.6"
}

variable "instance_class" {
  description = "The instance type of the PostgreSQL instance."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The amount of storage (in GB) for the PostgreSQL instance."
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type for the database."
  type        = string
  default     = "gp2"
}

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the PostgreSQL instance."
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs for the database subnet group."
  type        = list(string)
}

variable "environment" {
    type = string
}

variable "db_sg" {
    type = string
}
variable "sg_description" {
    type = string   
}

variable "egress_rule" {
    type = string   
}
variable "ingress_rule" {
    type = string   
}

variable "tcp_protocol" {
    type = string   
}

variable "postgres_from_port" {
    type = string   
}
variable "postgres_to_port" {
    type = string   
}

variable "vpc_id" {
    type = string   
}


/*




*/