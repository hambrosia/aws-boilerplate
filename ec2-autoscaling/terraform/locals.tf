locals {
  # Organization / Service Metadata
  org_plus_env = "${var.org_name}-${terraform.workspace}"

  service_plus_env = "${var.service_name}-${terraform.workspace}"

  environment = terraform.workspace

  # EC2
  launch_name = "lc-${terraform.workspace}-${var.service_name}"

  scaling_name = "asg-${terraform.workspace}-${var.service_name}"

  elb_name = "elb-${terraform.workspace}-${var.service_name}"

  # Security Groups
  sg_name_private_server = "secgr-${terraform.workspace}-private-server"

  sg_name_public_elb = "secgr-${terraform.workspace}-public-elb"

  sg_name_private_rds = "secgr-${terraform.workspace}-private-rds"

  # RDS
  rds_db_name = "rds-${terraform.workspace}-${var.service_name}"

  rds_username = "${var.org_name}-admin"
}