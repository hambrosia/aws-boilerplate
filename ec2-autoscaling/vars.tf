# General Defaults / Metadata
variable "org_name" {
  default = "hambrocorp"
}

variable "service_name" {
  default = "statuspage"
}

# VPC Defaults
variable vpc_cidr {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "nat_gateway_enabled" {
  default = false
}

variable "vpn_gateway_enabled" {
  default = false
}

# EC2 Defaults
variable "ebs_volume_size" {
  default = "10"
}

variable "ami_identifier" {
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type, x86"
  default     = "ami-0e01ce4ee18447327"
}

variable "asg_min_size" {
  default = 3
}

variable "asg_max_size" {
  default = 6
}

variable "asg_desired" {
  default = 3
}