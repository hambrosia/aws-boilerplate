locals {
    org_plus_env = "${var.org_name}-${terraform.workspace}"

    service_plus_env = "${var.service_name}-${terraform.workspace}"

    environment = terraform.workspace

    launch_name = "${var.service_name}-${terraform.workspace}-lc"

    scaling_name = "${var.service_name}-${terraform.workspace}-asg"
}