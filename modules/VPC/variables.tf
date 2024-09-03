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

variable "environment" {
    type = string
}

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
