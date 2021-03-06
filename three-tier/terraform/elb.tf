module "elb" {
  source = "terraform-aws-modules/elb/aws"

  name = local.elb_name

  subnets         = module.vpc.public_subnets
  security_groups = [aws_security_group.public_elb.id]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = var.elb_healthcheck_target
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = {
    Owner       = var.org_name
    Environment = local.environment
  }
}