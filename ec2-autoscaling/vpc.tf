module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.org_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = var.nat_gateway_enabled
  enable_vpn_gateway = var.vpn_gateway_enabled

  tags = {
    Terraform   = "true"
    Environment = local.environment
  }
}
