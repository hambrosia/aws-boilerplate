# General Defaults / Metadata
variable "org_name" {
  default = "hambro"
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

variable "db_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "public_subnets" {
  default = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
}

variable "nat_gateway_enabled" {
  default = true
}

variable "vpn_gateway_enabled" {
  default = false
}

# EC2 Defaults

variable "instance_type" {
  default = "t2.nano"
}

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
  default = 3
}

variable "asg_desired" {
  default = 3
}

variable "elb_healthcheck_target" {
  default = "HTTP:80/index.html"
}

# RDS Defaults

variable "rds_port" {
  default = "5432"
}

variable "rds_instance_class" {
  default = "db.t2.large"
}

variable "rds_pg_engine_version" {
  default = "9.6.9"
}

variable "rds_storage" {
  default = 5
}

variable "rds_encryption" {
  default = false
}

variable "rds_password" {
  default = "MakeSureYourPasswordIsStrongAndManagedCorrectly"
}

variable "rds_maintenance_window" {
  default = "Mon:00:00-Mon:03:00"
}

variable "rds_backup_window" {
  default = "03:00-06:00"
}

variable "rds_backup_retention_period" {
  default = 0
}

variable "rds_db_parameter_group" {
  default = "postgres9.6"
}
