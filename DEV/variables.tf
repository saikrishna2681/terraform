variable "ami_id" {
  description = "The AMI ID to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name tag for the instance."
  type        = string
}

variable "ebs_optimized" {
  description = "Whether the instance is optimized for EBS."
  type        = bool
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "The size of the root volume in GB."
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "The type of the root volume."
  type        = string
  default     = "gp2"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

/*
variable "name" {
  description = "The name of the PostgreSQL instance."
  type        = string
}
*/
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

/*
variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

*/
variable "project_name" {
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
variable "ssh_from_port" {
    type = string   
}
variable "ssh_to_port" {
    type = string   
}
variable "http_from_port" {
    type = string   
}
variable "http_to_port" {
    type = string   
}
variable "https_from_port" {
    type = string   
}
variable "https_to_port" {
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
variable "db_sg" {
    type = string   
}


/*

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs to associate with the PostgreSQL instance."
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs for the database subnet group."
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs for the database subnet group."
  type        = list(string)
}




variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "security_groups" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
  default     = []
}

*/



variable "name" {
    type = string
}
variable "environment" {
    type = string
}

variable "storage_class" {
    type = string
}

variable "days" {
    type = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for private subnets."
  type        = list(string)
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT gateway."
  type        = bool
  default     = true
}
