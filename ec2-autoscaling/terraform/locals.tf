locals {
  org_plus_env = "${var.org_name}-${terraform.workspace}"

  service_plus_env = "${var.service_name}-${terraform.workspace}"

  environment = terraform.workspace

  launch_name = "lc-${terraform.workspace}-${var.service_name}"

  scaling_name = "asg-${terraform.workspace}-${var.service_name}"

  elb_name = "elb-${terraform.workspace}-${var.service_name}"

  sg_name_private_server = "secgr-${terraform.workspace}-private-server"

  sg_name_public_elb = "secgr-${terraform.workspace}-public-elb"

}