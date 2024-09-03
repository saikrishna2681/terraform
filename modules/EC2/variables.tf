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

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}


variable "security_groups" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
  default     = []
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

variable "network_interface_id" {
  description = "The ID of the network interface to associate with the instance."
  type        = string
  default     = ""
}



variable "vpc_id" {
  description = "The ID of the VPC in which to create the security group."
  type        = string
}

